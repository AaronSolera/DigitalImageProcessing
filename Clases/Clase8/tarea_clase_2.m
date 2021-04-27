% Ejemplo de video

clc; clear; close all

pkg load image
pkg load video

V = VideoReader('files/chaplin.mp4');
fr = V.NumberOfFrames; % Número de Frames (Imágenes)
m = V.Height; % Número de Filas
n = V.Width; % Número de Columnas

Y = zeros(m, n * 2, 3, fr); % Matriz que representa a un video
B = zeros(m, n);
alfa = beta = 100;

for f = 1 : fr
  printf('%f completed\n', (f/fr) * 100);
  F = readFrame(V)(:,:,1);
  rmax = max(max(F));
  rmin = min(min(F));
  Smax = rmax - alfa;
  Smin = rmin - beta;
  for x = 1:m
    for y = 1:n
      B(x, y) = ((Smax - Smin) / (rmax - rmin)) * (F(x, y) - rmin) + Smin;
    endfor
  endfor
  Y(:,:,1,f) = Y(:,:,2,f) = Y(:,:,3,f) = [F, B];
  % Mostrando los frames mientras se procesan. Usar sólo para depuración
  % imshow(uint8(Y(:,:,1,f)))
  % pause(0.001)
end

% La matriz Y tiene la información del video
% Crear el video
video = VideoWriter('chaplin_reducción.mp4');

for i = 1 : fr
  writeVideo(video, Y(:,:,:,i));
endfor

close(video)