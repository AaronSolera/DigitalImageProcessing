clc; clear; close all
pkg load image

A = imread('fondo_verde.jpg');
subplot(2, 2, 1)
imshow(A)

B = imread('playa.jpg');
subplot(2, 2, 2)
imshow(B)

[m, n,dim] = size(A)
Br= uint8(B(:,:,1));
Bg= uint8(B(:,:,2));
Bb= uint8(B(:,:,3));
R = uint8(A(:,:,1));
G = uint8(A(:,:,2));
B = uint8(A(:,:,3));
R(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))) = uint8(Br(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))));
G(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))) = uint8(Bg(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))));
B(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))) = uint8(Bb(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))));

C = uint8(zeros(m,n,dim));
C(:,:,1) = R;
C(:,:,2) = G;
C(:,:,3) = B;
#C = uint8(zeros(m,n,dim));
#C(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))) = uint8(B(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))));
subplot(2, 2, 3)
imshow(C)