clc; clear; close all
pkg load image

#Leemos la imágen a reemplazar pixeles
A = imread('fondiada.jpg');
subplot(2, 2, 1)
imshow(A)
title('Imagen con borde feo')

[border,image] = getBorder(A);
subplot(2, 2, 2)
imshow(border)
title('Mask')

subplot(2, 2, 3)
imshow(image)
title('Result')