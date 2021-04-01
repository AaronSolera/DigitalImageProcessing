% Ejemplo con imagen a colorangle
clc; clear; close all;
pkg load image

A = imread('files/lena.jpg');

subplot(2,2,1)
imshow(A)
title('Imagen Original')

% Activar el canal rojo
[m, n, c] = size(A); % Tamaño de la imagen
Ar = zeros(m, n, c); % zeros crea una matriz nula en formato double
Ar(:, :, 1) = A(:, :, 1); % Asignar valores del canal rojo en Ar
Ar = uint8(Ar);

subplot(2,2,2)
imshow(Ar)
title('Canal Rojo')

% Activar el canal verde
[m, n, c] = size(A); % Tamaño de la imagen
Ag = zeros(m, n, c); % zeros crea una matriz nula en formato double
Ag(:, :, 2) = A(:, :, 2); % Asignar valores del canal verde en Ar
Ag = uint8(Ag);

subplot(2,2,3)
imshow(Ag)
title('Canal Verde')

% Activar el canal azul
[m, n, c] = size(A); % Tamaño de la imagen
Ab = zeros(m, n, c); % zeros crea una matriz nula en formato double
Ab(:, :, 3) = A(:, :, 3); % Asignar valores del canal azul en Ar
Ab = uint8(Ab);

subplot(2,2,4)
imshow(Ab)
title('Canal Verde')