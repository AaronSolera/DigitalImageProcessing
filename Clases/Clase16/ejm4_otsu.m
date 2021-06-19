% Ejemplo de umbral
clc; clear; close all

pkg load image

A = imread('files/imagen4.jpg');
subplot(2,2,1)
imshow(A)
title('Imagen Original')
[m, n] = size(A);

% Paso 0
[q, class] = imhist(A);
% Paso 1
h = q * (1/(m*n));
% Paso 2
p = cumsum(h);
% Paso 3
mc = cumsum((0:255)' .* h);
% Paso 4
mg = mc(256);
% Paso 5
sigma = ((mg * p - mc).^2) ./ (p .* (1 - p));
% Paso 6
T = find(sigma == max(sigma));

C = zeros(m,n);
C(A > T) = 1; C(A <= T) = 0;
subplot(2,2,3)
imshow(C)
title(['Umbral simple - Método de Otsu con T = ', T])
