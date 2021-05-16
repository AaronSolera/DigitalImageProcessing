clc; clear; close all
pkg load image

A = imread('files/imagen1.jpg');
A = binaria(im2double(A));
subplot(1,2,1);
imshow(A);
title('Imagen Original')

B = eye(2);

C = imdilate(A, B);
subplot(1,2,2);
imshow(C);
title('Imagen Dilatada')