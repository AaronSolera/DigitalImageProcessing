clc; clear; close all
pkg load image

A = imread('files/boat.jpg');
subplot(1,2,1)
imshow(A)
title('Imagen Original')

% Sugerencia: Trabajar estas operaciones en fomrato double
% con valores de 0,1,...,255
A = double(A);
[m, n] = size(A);
B = zeros(m, n);
% Transformada Exponencial
c = 1;
for gamma = 0.1:0.1:2
  B = c * A.^gamma;
  B = uint8(B);
  subplot(1, 2, 2)
  imshow(B)
  title(['Imagen Modificada. Gamma =' num2str(gamma)])
  pause(0.1)
endfor