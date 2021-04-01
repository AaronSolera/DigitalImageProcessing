% Ejemplo del comando SVD

clc; clear; close all
pkg load image

% Cargar la imagen
I_color = imread('files/img1.jpg');
A = I_color(:,:,1);

[m, n] = size(A);

% Nota: Para usar la SVD, se necesita tener una imagen en formato 
% double normalizado (im2double)

A = im2double(A); % Double normalizado

[U,S,V] = svd(A);
% U es de tamaño 5x5
% S es de tamaño 5x3
% V es de tamaño 5x3

% Rango reducido
r = 400; % Aproximar A con una matriz de rango r, donde r tiene que ser menor al número menor del tamaño de la imagen. Ejemplo: en una imagen de 100x20 el r máximo sería 20.
Ur = U(:,1:r);
Vr = V(:,1:r);
Sr = S(1:r,1:r);

A; % Matriz original
Ar = Ur * Sr * Vr'; % Mejor aproximación de rango n
error = norm(A - im2double(Ar), 'fro') % Error obtenido mediante la norma de frobenius

% Mostrar aproximación
Ar = im2uint8(Ar);

figure
subplot(1,2,1)
imshow(A)

subplot(1,2,2)
imshow(Ar)

% Mostrar comportamiento de los valores singulares
% val_sing = diag(S); % Vector con los valores de la diagonal
% plot(1:length(val_sing), val_sing)
% title('Valores sigulares de la matriz A')
