clc; clear; close all

pkg load image

A = imread('files/imagen6.jpg');
subplot(1,2,1)
imshow(A)
title('Imagen Original')
A = binaria(im2double(A));
% Elemento Estructurado
B = ones(3,3);
% Borde Interno: A-(A erosion B)
C = imerode(A, B);
D = A & ~C;
subplot(1,2,2)
imshow(D)
title('Imagen Borde Interno')