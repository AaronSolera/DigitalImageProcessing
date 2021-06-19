%ejemplo umbral
clc; clear; close all
A = imread('peppers.jpg');
subplot(1,3,1);
imshow(A)
title('Imágen original');

A = im2double(A); [m,n]=size(A);

%Caso 1 umbral simple
T = 0.5; B=zeros(m,n);
B(A>=T)=1;
B(A<T)=0;
subplot(1,3,2);
imshow(B);
title('Umbral simple');

%Caso 2 umbral compuesto
T1 = 1/3; T2=2/3; C = zeros(m,n);
C(A>T2)=1;
C(and(T1<A,A<T2))=0.5;
C(A<=T1)=0;
subplot(1,3,3)
imshow(C);
title('Umbral modificada')
