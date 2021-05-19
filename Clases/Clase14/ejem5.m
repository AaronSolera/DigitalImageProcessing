clc; clear; close all

pkg load image

A = imread('files/imagen5.jpg');
subplot(1,3,1)
imshow(A)
title('Imagen Original')
A = im2double(A);
A = binaria(A);
B = [1 1; 1 1];
C = imerode(A, B);
subplot(1,3,2);
imshow(C);
title('Imagen Erosion')
D = imdilate(C, B);
subplot(1,3,3);
imshow(D);
title('Imagen Dilatada')