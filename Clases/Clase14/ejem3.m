clc; clear; close all

pkg load image

A = [0 0 0 0 0;
     0 1 1 0 0;
     0 1 1 0 0;
     0 0 1 0 0;
     0 0 0 0 0];
     
B = strel('diamond', 1)

C = imdilate(A, B)