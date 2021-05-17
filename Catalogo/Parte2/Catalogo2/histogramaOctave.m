clc; clear; close all;
pkg load image;

A=imread('peppers.jpg');
subplot(2,2,1);
imshow(A);
title('Imagen original');

%Forma 1 de calcular el histograma

h1 = zeros(256,1); %Entradas  ==> h1(0),...,h(256)
[m,n] = size(A);
for x=1:m
  for y=1:n
    h1(A(x,y)+1) += 1;
  end
end

subplot(2,2,2);
bar(0:255,h1);
title('histograma1')
xlim([0 255])