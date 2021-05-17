clc; clear; close all;
pkg load image;

A=imread('sydney.jpg');
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

%calcular la funcion de distribución acumulativa
[m,n] = size(A);
v_ac = zeros(256,1);
for i=0:255
  v_ac(i+1) = sum(h1(1:i+1))/(m*n);
end
subplot(2,2,3);
bar(0:255,v_ac);
title('Distribución acumulativa');
xlim([0 255]);

%método de ecualizacion
B = zeros(m,n);
A = double(A);
for x=1:m
   for y=1:n
     B(x,y) = round(v_ac(A(x,y)+1)*255);
   end
end

B = uint8(B);
subplot(2,2,4);
imshow(B);
title('Imagen ecualizada')