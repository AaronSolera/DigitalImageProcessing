# incomplete!!!

clc; clear; close all

pkg load image; 

A = imread('files/imagen2.jpg');
B = imread('files/imagen3.jpg');

subplot(1,2,1)
imshow(A)
subplot(1,2,2)
imshow(B)

[m, n] = size(A);
A = im2double(A);
B = im2double(B);
I_blanco = ;
I_negro = ;