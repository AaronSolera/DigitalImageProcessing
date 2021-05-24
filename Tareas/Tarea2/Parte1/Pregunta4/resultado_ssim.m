clc; clear; close all

pkg load image
pkg load video

%
V_0 = VideoReader('../Pregunta2/files/video.mp4');
V_1 = VideoReader('../Pregunta3/files/video_sin_ruido_alg1.mp4');
V_2 = VideoReader('../Pregunta3/files/video_sin_ruido_alg2.mp4');
% Número de Frames (Imágenes)
fr = V_0.NumberOfFrames; 

H_V1 = [];
H_V2 = [];

for k = 1 : fr
  F_V  = readFrame(V_0);
  F_V1 = readFrame(V_1);
  F_V2 = readFrame(V_2);
  %
  H_V1(end+1) = ssim(F_V(:,:,1), F_V1(:,:,1));
  H_V2(end+1) = ssim(F_V(:,:,1), F_V2(:,:,1));
end

hist(H_V1);
hist(H_V2);

close(video_1)
close(video_2)
