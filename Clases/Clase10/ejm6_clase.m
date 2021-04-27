clc; clear; close all
pkg load image

A = imread('files/baby_yoda.jpg');
subplot(1, 2, 1)
imshow(A)

% Crear la máscaras del operador de Sobel
Bx = [-1 -2 -1; 0 0 0; 1 2 1];
By = [-1 0 1; -2 0 2; -1 0 1];
A = im2double(A);
Cx = conv2(A, Bx, 'same');
Cy = conv2(A, By, 'same');
C = sqrt(Cx.^2 + Cy.^2);
C = im2uint8(C);
subplot(1, 2, 2)
imshow(C)