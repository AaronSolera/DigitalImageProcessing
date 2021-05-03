clc; clear; close all
pkg load image

% Cargar la imagen
file = input("\nWrite the image path (press enter to default image):\n\n>", "s");

if strncmp (file, '', 3)
    file = 'files/child.jpg';
endif

A = imread(file);
subplot(1, 2, 1)
imshow(A)
title('Imagen original')

% Crear la mascara del filtro laplaciano
B = [1 1 1; 1 -8 1; 1 1 1];
A = im2double(A);
C = conv2(A, B, 'same');
C = im2uint8(C);
subplot(1, 2, 2)
imshow(C)
title('Imagen con filtro laplaciano')

pause(10)