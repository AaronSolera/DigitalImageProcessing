% Ejemplo de umbral
clc; clear; close all

pkg load image

A = imread('files/imagen2.jpg');
subplot(2,3,1)
imshow(A)
title('Imagen Original')

A = im2double(A); 
[m, n] = size(A);

% Histograma de A
subplot(2,3,4)
imhist(A)
title('Histograma')

% Ruido 1
a1 = 0.2 ^ 2;
B1 = A + a1 * randn(m, n);
subplot(2,3,2)
imshow(B1)
title('Imagen Ruido 1')

% Histograma de B1
subplot(2,3,5)
imhist(B1)
title('Histograma')

% Ruido 2
a2 = 0.5 ^ 2;
B2 = A + a2 * randn(m, n);
subplot(2,3,3)
imshow(B2)
title('Imagen Ruido 2')

% Histograma de B2
subplot(2,3,6)
imhist(B2)
title('Histograma')