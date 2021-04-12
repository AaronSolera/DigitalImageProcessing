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
  L = A; S = zeros(size(A)); t = 0; error = 0;
  do
    prev_error = error;
    t = t + 1;
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

video = VideoReader('files/video.mp4');
% La matriz Y tiene la información del video
% Crear el video
video2L = VideoWriter('files/video1_L.mp4');
video2S = VideoWriter('files/video1_S.mp4');
fr = video.NumberOfFrames % Número de Frames (Imágenes)
m = video.Height % Número de Filas
n = video.Width % Número de Columnas
k = 2;
c0 = 0.07 * m * n;
epsilon = 10**-9;
pp_video = zeros(m, n, fr); % Matriz que representa a un video
bg_video = zeros(m, n, fr); % Matriz que representa a un video

for f = 1 : 30
  frame = readFrame(video);
  frame = im2double(frame);
  frame = rgb2gray(frame);
  display(f)
  % Guardando la información de V en Y
  [bg_video(:, :, f), pp_video(:, :, f)] = godec(frame, k, c0, epsilon);
  temp_bg_frame = bg_video(:, :, f);
  temp_pp_frame = pp_video(:, :, f);
  % 
  %imshow(uint8(temp_bg_frame))
  %imshow(uint8(temp_pp_frame))
  % 
  % writeVideo(video2L, temp_bg_frame);
  % writeVideo(video2S, temp_pp_frame);
end

close(video)