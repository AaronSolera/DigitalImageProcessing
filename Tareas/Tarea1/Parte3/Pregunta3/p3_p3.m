clc; clear; close all

pkg load image
pkg load video

function [Ar] = svd_red_bi(A, r, p)
  % Step 1
  n = size(A, 2);
  Y2 = randn(n, r);
  % Step 2
  for k = 1 : p
    Y1 = A * Y2;
    Y2 = A' * Y1;
  endfor
  % Step 3
  [Q, ~] = qr(Y2); 
  % Step 4
  Qr = Q (:, 1:r);
  % Step 5
  B = A * Qr;
  C = Qr';
  Ar = B * C;
endfunction

function [Ar] = svd_red(A, r)
  [U, S, V] = svd(A);
  Ur = U(:, 1:r);
  Vr = V(:, 1:r);
  Sr = S(1:r, 1:r);
  Ar = Ur * Sr * Vr';
endfunction

function [A_c0] = Pc0(A_, c0)
  A_c0 = zeros(size(A_));
  A_temp = A_(:);
  [_, ind] = sort(abs(A_temp), 'descend');
  A_c0(ind(1:c0)) = A_(ind(1:c0));
endfunction

function [L, S, error] = godec(A, k, c0, epsilon)
  L = A; S = zeros(size(A)); error = 0;
  do
    prev_error = error;
    L = svd_red(A - S, k);
    S = Pc0(A - L, c0);
    error = norm(A - L - S, 'fro')**2 / norm(A, 'fro')**2;
  until abs(error - prev_error) < epsilon
endfunction

function [L, S, error] = godec_fast(A, k, c0, epsilon)
  L = A; S = zeros(size(A)); t = 0; error = 0;
  do
    prev_error = error;
    t = t + 1;
    L = svd_red_bi(A - S, k, 3);
    S = Pc0(A - L, c0);
    error = norm(A - L - S, 'fro')**2 / norm(A, 'fro')**2;
  until abs(error - prev_error) < epsilon
endfunction

video = VideoReader('files/video_mega_resized.mp4');
% La matriz Y tiene la información del video
% Crear el video
video1_L = VideoWriter('files/video1_L.mp4');
video1_S = VideoWriter('files/video1_S.mp4');
fr = video.NumberOfFrames % Número de Frames (Imágenes)
m = video.Height; % Número de Filas
n = video.Width;  % Número de Columnas
k = 2;
c0 = 0.07 * m * n;
epsilon = 10**-9;
pp_video = zeros(m, n, 3, fr); % Matriz que representa a un video
bg_video = zeros(m, n, 3, fr); % Matriz que representa a un video

for f = 1 : fr
  frame = readFrame(video);
  frame = im2double(frame);
  display(f)
  % Guardando la información de V en Y
  [L1, S1, _] = godec(frame(:, :, 1), k, c0, epsilon);
  [L2, S2, _] = godec(frame(:, :, 2), k, c0, epsilon);
  [L3, S3, _] = godec(frame(:, :, 3), k, c0, epsilon);
  pp_video(:, :, 1, f) = im2uint8(L1);
  pp_video(:, :, 2, f) = im2uint8(L2);
  pp_video(:, :, 3, f) = im2uint8(L3);
  bg_video(:, :, 1, f) = im2uint8(S1);
  bg_video(:, :, 2, f) = im2uint8(S2);
  bg_video(:, :, 3, f) = im2uint8(S3);
  %subplot(1,2,1)
  %imshow(bg_video(:, :, :, f));
  %title('Background video');
  %subplot(1,2,2)
  %imshow(pp_video(:, :, :, f));
  %title('People video');
  %pause(0.00001);
end

for f = 1 : fr
  writeVideo(video1_L, bg_video(:, :, :, f));
  writeVideo(video1_S, pp_video(:, :, :, f));
endfor

close(video)