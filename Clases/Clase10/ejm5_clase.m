clc; clear; close all
pkg load image

A = imread('files/Columnas.jpg');
subplot(1, 3, 1)
imshow(A)

% Crear la mascara del filtro de Laplace
C = filtro_general(A, 'l');
subplot(1, 3, 2)
imshow(C)

% Resaltar bordes
c = 1;
D = A + c * C;
subplot(1,3,3)
imshow(D)