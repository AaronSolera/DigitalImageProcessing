clc; clear; close all

pkg load image;
pkg load video;

% Ejemplo de video

clc; clear; close all

pkg load image
pkg load video

V = VideoReader('files/video.mp4');
fr = V.NumberOfFrames; % Número de Frames (Imágenes)
m = V.Height; % Número de Filas
n = V.Width; % Número de Columnas

Y = zeros(m, n, 3, fr); % Matriz que representa a un video

for k = 1 : fr * 0.9
  F = readFrame(V);
  %Guardando la información de V en Y
  N = imnoise(F(:,:,1), "salt & pepper");
  Y(:,:,1,k) = Y(:,:,2,k) = Y(:,:,3,k) = N;
  imshow(uint8(Y(:, :, :, k)))
  pause(0.0001)
end

% La matriz Y tiene la información del video
% Crear el video
video = VideoWriter('files/video_con_ruido.mp4');

for i = 1 : fr
  writeVideo(video, Y(:,:,:,i));
endfor

close(video)
