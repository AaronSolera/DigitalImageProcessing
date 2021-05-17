clc; clear; close all;
pkg load image;

A = imread("edificio_china.jpg");

Y_ilpf = ideal_lpf(A,100);
figure(1);
subplot(1,2,1);
imshow(A);
title("Original image");
subplot(1,2,2);
imshow(Y_ilpf);
title("Ideal (LPF)");

Y_blpf = butterworth_lpf(A,100,2);
figure(2);
subplot(1,2,1);
imshow(A);
title("Original image");
subplot(1,2,2);
imshow(Y_blpf);
title("Butterworth (LPF)");

Y_ghpf = gaussian_hpf(A,2.0);
figure(3);
subplot(1,2,1);
imshow(A);
title("Original image");
subplot(1,2,2);
imshow(Y_ilpf);
title("Gaussian (HPF)");
