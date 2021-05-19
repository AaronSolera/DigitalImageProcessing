clc; clear; close all

pkg load image

A = imread('files/imagen5.jpg');
subplot(1,3,1)
imshow(A)
title('Imagen Original')
A = im2double(A);
A = binaria(A);
B = strel('diamond', 1);
C = imclose(A, B);
subplot(1,3,2);
imshow(C);
title('Imagen con Clausura')
D = imopen(C, B);
subplot(1,3,3);
imshow(D);
title('Imagen con Apertura')