clc; clear; close all
pkg load image

A = imread('files/peppers.jpg');
subplot(2, 2, 1)
imshow(A)
title('Imagen Original')

% Forma 1 de calcular el histograma
h1 = zeros(256, 1); %h1 = [h(0) h(1) ... h(255)]
[m, n] = size(A);

tic
for x = 1:m
  for y = 1:n
    h1(A(x,y)+1) += 1;
  endfor
endfor
t1 = toc

subplot(2, 2, 2)
bar(0:255, h1)
title('Histograma 1')
xlim([0 255])

% Forma 2 de calcular el histograma
h1 = zeros(256, 1); %h1 = [h(0) h(1) ... h(255)]

tic
for i = 0:255
    h1(i+1) = sum(sum(A==i));
endfor
t2 = toc

subplot(2, 2, 3)
bar(0:255, h1)
title('Histograma 2')
xlim([0 255])

% Forma 2 de calcular el histograma
subplot(2,2,4)
tic
imhist(A) % Comando Octave
t3 = toc
title('Histograma 3')