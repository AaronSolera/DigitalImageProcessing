% Ejemplo del comando SVD
clc; clear; close all
pkg load image

% Cargar la imagen
file = input("\nWrite the image path (press enter to default image):\n\n>", "s");

if strncmp (file, '', 3)
    file = 'files/img1.jpg';
endif

I_color = imread(file);
A = I_color(:,:,1);

% Almacenar la imagen A (8-bits) en un archivo .mat
[m, n] = size(A);

% Nota: Para usar la SVD, se necesita tener una imagen en formato 
% double normalizado (im2double)
A = im2double(A); % Double normalizado
[U,S,V] = svd(A);

% Rango reducido
r = 200; % Aproximar A con una matriz de rango r, donde r tiene que ser menor al número menor del tamaño de la imagen. Ejemplo: en una imagen de 100x20 el r máximo sería 20.
Ur = U(:,1:r);
Vr = V(:,1:r);
Sr = S(1:r,1:r);

B = Ur*Sr;
C = Vr';

Ar = B*C; % Mejor aproximación de rango 2
B1 = im2uint8(B);
C1 = im2uint8(C);

save('B.mat','B1')
save('C.mat','C1')

% Mostrar aproximación
Ar = im2uint8(Ar); % Convertir en formato de 8 bitset

figure
subplot(1,2,1)
imshow(A)

subplot(1,2,2)
imshow(Ar)