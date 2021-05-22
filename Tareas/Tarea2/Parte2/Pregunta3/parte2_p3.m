clear; clc; close all;
pkg load image;

iters = 10;

a = 0.073235;
b = 0.176765;
c = 0.125;

% Defining the first diffusion kernel
k1 = [ a b a ;
       b 0 b ;
       a b a ];
       
% Defining the second diffusion kernel
k2 = [ c c c ;
       c 0 c ;
       c c c ];

% Image to restore: X
X = imread('paisaje_con_marca.jpg');
subplot(2,2,1);
imshow(X);
title('(a) Image to restore','FontSize',14);

% Mask image: H
H = imread('marca.jpg');
H(H < 50) = 0; 
H(H >= 50) = 255;
subplot(2,2,2);
imshow(H);
title('(b) Mark','FontSize',14);

% Converting the image to double to apply convolution
X = im2double(X);

% Making mask binary
H(H(:,:) == 255) = 1;

for i = 1:iters
  % Convolution between the image and the kernel
  C = conv2(X, k1, shape="same");
  C = conv2(C, k2, shape="same");
  % Clearing non-mask pixels information in convolution result
  C(H(:,:) == 0) = 0;
  % Clearing mask pixels information in the original image
  X(H(:,:) == 1) = 0; 
  % Adding the convolution information to the original image
  X += C;
end

% Restored image: X
subplot(2,2,3);
imshow(im2uint8(X));
title('(c) Restored image','FontSize',14);
