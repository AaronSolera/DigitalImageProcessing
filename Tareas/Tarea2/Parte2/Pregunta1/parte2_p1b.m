clc; clear; close all;

% Defining the first 4x4 matrix of the 3D matrix
A(:,:,1) = [ 5 10 15 20 ;
             4  8 12 16 ;
             3  6  9 12 ;
             2  4  6  8 ];

% Defining the second 4x4 matrix of the 3D matrix     
A(:,:,2) = [ 1  2  3  4 ;
             1  3  5  7 ;
             2  4  6  8 ;
             1  4  7 10 ];

% Defining the third 4x4 matrix of the 3D matrix 
A(:,:,3) = [ 0  0  0  0 ; 
             5  5  5  5 ; 
            10 10 10 10 ; 
            15 15 15 15 ];
            
% Creating the output matrix
[m,n,k] = size(A);
C = zeros(m,n,k);

% Changing the matrix's values that meet the established conditions
C(A(:,:,:) <= 10) = -30;
C(A(:,:,:) > 10) = 30;

% Showing the output matrix
C
