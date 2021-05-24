clc; clear; close all

pkg load image
pkg load video

%
V_0 = VideoReader('../Pregunta2/files/video.mp4');
V_1 = VideoReader('../Pregunta3/files/video_sin_ruido_alg1.mp4');
V_2 = VideoReader('../Pregunta3/files/video_sin_ruido_alg2.mp4');
% Número de Frames (Imágenes)
fr = V_1.NumberOfFrames

H_V1 = zeros(fr);
H_V2 = zeros(fr);
V_x  = zeros(fr);


for k = 1 : fr
  F_V  = readFrame(V_0);
  F_V1 = readFrame(V_1);
  F_V2 = readFrame(V_2);
  
  [H_V1(k),extra] = ssim(F_V(:,:,1), F_V1(:,:,1));
  [H_V2(k),extra] = ssim(F_V(:,:,1), F_V2(:,:,1));
  V_x(k) = k; 
end


subplot(1,2,1);
plot(H_V1);
title("FMFA")

subplot(1,2,2);
plot(H_V2);
title("IAMFA-I")

close(V_1)
close(V_2)