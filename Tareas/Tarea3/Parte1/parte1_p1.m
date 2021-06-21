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

[m, n,dim] = size(A)
#Obtenemos los componentes RGB de la im�gen 2 a mesclar
Br= uint8(B(:,:,1));
Bg= uint8(B(:,:,2));
Bb= uint8(B(:,:,3));
#Realizamos una copia para sobre escritura de la imagen
R = uint8(A(:,:,1));
G = uint8(A(:,:,2));
B = uint8(A(:,:,3));
#Mesclamos los componentes RGB de la im�gen A y la im�gen B
#La operaci�n and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50)) se utiliza de filtro para saber que componentes
#de la im�gen A deben ser reemplazdos por la  im�gen B se hace esto para todos los pixeles RGB
#Utiliza ANDs anidados para validar
R(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))) = uint8(Br(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))));
G(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))) = uint8(Bg(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))));
B(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))) = uint8(Bb(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))));

#Creamos la matriz Resultante con ceros
C = uint8(zeros(m,n,dim));

#Se combinan los tres componentes de la im�gen en la im�gen final C
C(:,:,1) = R;
C(:,:,2) = G;
C(:,:,3) = B;

#Mostramos la im�gen final C filtrada
subplot(2, 2, 3)
imshow(C)
title('Im�gen efecto croma')
