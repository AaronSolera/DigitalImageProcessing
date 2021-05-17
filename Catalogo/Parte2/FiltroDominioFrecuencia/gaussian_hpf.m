function Y = gaussian_hpf(X,sigma)
  
  % Saving the size of the input image in pixels
  % M : no of rows    (height of the image)
  % N : no of columns (width of the image)
  [M,N] = size(X);
  
  % Getting Fourier Transform of the input image
  % using OCTAVE library function fft2 (2D fast fourier transform)
  FT = fft2(im2double(X));
  
  % Designing the filter
  u = 0:(M-1);
  idx = find(u>M/2);
  u(idx) = u(idx)-M;
  v = 0:(N-1);
  idy = find(v>N/2);
  v(idy) = v(idy)-N;

  % OCTAVE library function meshgrid(v, u) returns
  % 2D grid which contains the coordinates of vectors
  % v and u. Matrix V with each row is a copy 
  % of v, and matrix U with each column is a copy of u
  [V,U] = meshgrid(v,u);
  
  % Calculating Euclidean Distance
  D = sqrt(U.^2+V.^2);
  
  % Determining the filtering mask
  H = 1 - exp(-(D.^2)./(2*sigma^2));
  
  % Convolution between the Fourier Transformed
  % image and the mask
  G = H.*FT;
  
  % Getting the resultant image by Inverse Fourier Transform
  % of the convoluted image using MATLAB library function 
  % ifft2 (2D inverse fast fourier transform)
  Y = ifft2(G);
  Y = im2uint8(abs(Y));
  
  return
  
endfunction