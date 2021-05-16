# incomplete!!!

clc; clear; close all

pkg load image; 

A = imread('files/imagen2.jpg');
B = imread('files/imagen3.jpg');

subplot(1,3,1)
imshow(A)
subplot(1,3,2)
imshow(B)

A = im2double(A);
B = im2double(B);


I_blanco = ;
I_negro = ;