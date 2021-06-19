%ejemplo umbral
clc; clear; close all
pkg load image

A = uint8(imread('imagen4.jpg'));
subplot(1,2,1);
imshow(A)
title('Imágen original');
[m,n]=size(A);

q = imhist(A);

h = q/(m*n);

p = cumsum(h);

i = (0:255)';
mc = cumsum(i.*h);

mg = mc(255);

sigma = ((mg*p-mc).^2) ./(p.*(1-p));

T = find(sigma==max(sigma))

B=zeros(m,n);
B(A>=T)=1;
B(A<T)=0;
subplot(1,2,2);
imshow(B);
title('Umbral Otsu');