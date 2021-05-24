clc; clear; close all

pkg load image;
pkg load video;

% Ejemplo de video

clc; clear; close all

pkg load image
pkg load video

function P_ = MVDM(P)
	P = sort(P);
	P_ = P(2);
	if P(2) == 0
		P_ = P(3); 
	end
	if P(3) == 255
		P_ = P(1);
	end
end


function A_ = FMFA(A)
  [H, W] = size(A);
  A_ = zeros(H, W);
  
  for x=2:(H-1)
    col1 = median([A(x-1, 1), A(x, 1), A(x+1, 1)]);
    col2 = median([A(x-1, 2), A(x, 2), A(x+1, 2)]);
    for y=3:(W-1)
      col3 = median([A(x-1, y), A(x, y), A(x+1, y)]);
      A_(x, y) = median([col1, col2, col3]);
      col1 = col2;
      col2 = col3;
    end
  end
  A_ = uint8(A_);
endfunction

function A_ = IAMFA(A)
  [H,W] = size(A);
  A_ = zeros(H,W);
  
  for x=2:(H-1)
    col1 = MVDM([A(x-1,1), A(x,1) , A(x+1,1)]);
    col2 = MVDM([A(x-1,3), A(x,2) , A(x+1,2)]);
    for y=3:(W-1)
      col3 = MVDM([A(x-1,y) , A(x,y) , A(x+1,y)]);
      A_(x, y) = MVDM([col1; col2; col3]);
      col1 = col2;
      col2 = col3;
    end
  end
  A_ = uint8(A_);
endfunction

V = VideoReader('../Pregunta2/files/video_con_ruido.mp4');
fr = V.NumberOfFrames; % Número de Frames (Imágenes)
m = V.Height; % Número de Filas
n = V.Width; % Número de Columnas

Y = zeros(m, n, 3, fr); % Matriz que representa a el video_1
Z = zeros(m, n, 3, fr); % Matriz que representa a el video_2

for k = 1 : fr * 0.9
  F = readFrame(V);
  %Guardando la información de N y M en Y y Z respectivamente
  tic
  N = FMFA(F(:,:,1));
  M = IAMFA(F(:,:,1));
  t = toc;
  %
  Y(:,:,1,k) = Y(:,:,2,k) = Y(:,:,3,k) = N;
  Z(:,:,1,k) = Z(:,:,2,k) = Z(:,:,3,k) = M;
  disp(["Progress: " num2str((k/fr) * 100) "%, " num2str((t * ((fr * 0.9) - k)) / 60) " minutes left"]);
  %
  % subplot(1,2,1)
  % imshow(uint8(Y(:, :, :, k)))
  % title("Filtro FMFA")
  % subplot(1,2,2)
  % imshow(uint8(Z(:, :, :, k)))
  % title("Filtro IAMFA")
  % pause(0.001)
end

% La matriz Y tiene la información del video
% Crear el video
video_1 = VideoWriter('files/video_sin_ruido_alg1.mp4');
video_2 = VideoWriter('files/video_sin_ruido_alg2.mp4');

for i = 1 : fr
  writeVideo(video_1, Y(:,:,:,i));
  writeVideo(video_2, Z(:,:,:,i));
endfor

close(video_1)
close(video_2)