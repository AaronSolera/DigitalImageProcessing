% Ejemplo con imagen a colorangle
clc; clear; close all;
pkg load image

A = imread('files/lena.jpg');

subplot(2,2,1)
imshow(A)
title('Imagen Original')

Ar = A(:, :, 1); % El canal rojo
subplot(2,2,2)
imshow(Ar)
title('Canal Rojo')

Ag = A(:, :, 2); % El canal verde
subplot(2,2,3)
imshow(Ag)
title('Canal Verde')

Ab = A(:, :, 2); % El canal verde
subplot(2,2,4)
imshow(Ab)
title('Canal Azul')
