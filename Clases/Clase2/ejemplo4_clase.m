% Ejemplo de video

clc; clear; close all

pkg load image
pkg load video

V = VideoReader('files/VIDEO.mp4');
fr = V.NumberOfFrames; % Número de Frames (Imágenes)
m = V.Height; % Número de Filas
n = V.Width; % Número de Columnas

Y = zeros(m, n, 3, fr) % Matriz que representa a un video

for k = 1 : fr
  Z1 = readFrame(V);
  %Guardando la información de V en Y
  Y(:,:,1,k) = 255 - Z1(:,:,1);
  Y(:,:,2,k) = 255 - Z1(:,:,2);
  Y(:,:,3,k) = 255 - Z1(:,:,3);
  imshow(uint8(Y(:, :, :, k)))
  pause(0.1)
end

% La matriz Y tiene la información del video
% Crear el video
video = VideoWriter('video_salida.mp4');

for i = 1 : fr
  writeVideo(video, Y(:,:,:,i));
endfor

close(video)