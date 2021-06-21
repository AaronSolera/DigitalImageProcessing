clc; clear; close all

pkg load image
pkg load video

%
V_0 = VideoReader('video_avion.mp4');
V_1 = VideoReader('video_cielo.mp4');


fr = V_0.NumberOfFrames; % Número de Frames (Imágenes)
m = V_0.Height; % Número de Filas
n = V_0.Width; % Número de Columnas

#[border,image] = getBorder(A)

Y = zeros(m, n, 3, fr); % Matriz que representa a un video


for k = 1 : fr
  F_V  = readFrame(V_0);
  F_V1 = readFrame(V_1);
  fondo = getMerge(F_V, F_V1);
  [border,fondo] = getBorder(fondo);
  Y(:,:,:,k) = fondo;
end

video = VideoWriter('videdo.mp4');
for i = 1 : fr
  writeVideo(video, Y(:,:,:,i));
endfor

close(V_0)
close(V_1)