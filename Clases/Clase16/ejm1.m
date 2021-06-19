% Ejemplo de umbral
clc; clear; close all
A = imread('files/imagen1.jpg');
subplot(1,3,1)
imshow(A)
title('Imagen Original')

A = im2double(A); 
[m, n] = size(A);

% Caso 1: Umbral Simple (Imagen Binaria)
T = 0.5; B = zeros(m, n);
B(A >= T) = 1; % I1 = [0.5, 1]
B(A < T) = 0;  % I2 = [0, 0.5[
subplot(1,3,2)
imshow(B)
title('Imagen Binaria')

% Caso 2: Umbral Compuesto
T1 = 1/3; T2 = 2/3; C = zeros(m, n);
C(A > T) = 1; % I1 = ]2/3, 1]
C(and(T1 < A, A <= T2)) = 0.5; % I2 = ]1/3, 2/3]
C(A <= T1) = 0; % I3 = [0, 1/3]
subplot(1,3,3)
imshow(C)
title('Imagen Ternaria')