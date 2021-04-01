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
c = 1; 
for b = -75:5:75
  B = c * A + b; % esta operación lo que hace es hacer c * A + b * ones(m, n)

  B = uint8(B);
  subplot(1, 2, 2)
  imshow(B)
  title(['Imagen Modificada: b =' num2str(b)])
  pause(0.1)
endfor