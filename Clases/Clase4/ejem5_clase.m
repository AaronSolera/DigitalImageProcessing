% Ejemplo del comando SVD

clc; clear; close all
pkg load image

% Cargar la imagen
I_color = imread('files/img1.jpg');
A = I_color(:,:,1);

% Nota: Para usar la SVD, se necesita tener una imagen en formato 
% double normalizado (im2double)
A = im2double(A); % Double normalizado

r = 200;

[B1, C1] = rango_reducido(A,r);
Ar1 = B1 * C1; % Matriz de rango reducido usando SVD

[B2, C2] = rango_reducido_bilateral(A, r, 3);
Ar2 = B2 * C2; % Matriz de rango reducido usando proyección bilateral

Ar1 = im2uint8(Ar1);
Ar2 = im2uint8(Ar2);

figure
subplot(1,2,1)
imshow(Ar1)

subplot(1,2,2)
imshow(Ar2)

% Mostrar comportamiento de los valores singulares
% val_sing = diag(S); % Vector con los valores de la diagonal
% plot(1:length(val_sing), val_sing)
% title('Valores sigulares de la matriz A')
