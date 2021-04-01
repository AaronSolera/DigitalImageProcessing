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
% Negativo de una Imagen
c = -1; b = 255; 
B = c * A + b; % esta operación lo que hace es hacer c * A + b * ones(m, n)
B = uint8(B);
subplot(1, 2, 2)
imshow(B)
title(['Imagen Modificada: b =' num2str(b)])