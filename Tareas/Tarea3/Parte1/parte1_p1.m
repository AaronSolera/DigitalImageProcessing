clc; clear; close all
pkg load image

#Leemos la im�gen a reemplazar pixeles
A = imread('fondo_verde.jpg');
subplot(2, 2, 1)
imshow(A)

#Leemos la im�gen de fondo
B = imread('playa.jpg');
subplot(2, 2, 2)
imshow(B)
C = getMerge(A,B);
#Mostramos la im�gen final C filtrada
subplot(2, 2, 3)
imshow(C)
imwrite(C,'fondiada.jpg')
title('Im�gen efecto croma')
