% Primer Ejemplo
clc;        % Limpiar la información de la ventana de comandos
clear;      % Limpiar las variables de la memoria
close all;  % Cerrar todas las figuras expuesta

pkg load image

A = imread('files/camarografo.jpg');
% Las imagenes se trabajan en dos formatos:
  % 1: 8 bits {0,1,.....,255} * El formato por defecto
  % 2: Double normalizado [0,1]
  
imshow(A) % Mostrar la imagen que representa la matriz A

B = A(2:5, 3:6);

B1 = double(B); % Cambia de formato a double (no modifica valores)
B2 = im2double(B); % Cambia de formato y los valores
B3 = uint8(B2); % Redondea los valores y los convierte a formato de 8 bits
B4 = im2uint8(B2); % Toma valores de [0,1] y lo convierte a formato de 8 bits

imshow(B2)