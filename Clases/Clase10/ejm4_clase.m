clc; clear; close all
pkg load image

A = imread('files/child.jpg');
subplot(1, 2, 1)
imshow(A)

% Crear la mascara del filtro gaussiano
C = filtro_general(A, 'gaussiano');
subplot(1, 2, 2)
imshow(C)