clc; clear; close all

pkg load image

A = imread('files/imagen7.jpg');
subplot(1,2,1)
imshow(A)
title('Imagen Original')
A = binaria(im2double(A));

%Elemento  Estructurado
B = ones(4);
% Valor inicial X0 = imagen con un pixel blanco en la parte a rellenar\
[m, n] = size(A);
X = zeros(m, n);
cx = floor((m + 1) / 2);
cy = floor((n + 1) / 2);
X(cx, cy) = 1;
for k = 1:100
  C = imdilate(X, B);
  X = C & ~A;
  subplot(1,2,2)
  imshow(C)
  title(['Iteracion: ' num2str(k)])
  pause(0.1)
endfor
