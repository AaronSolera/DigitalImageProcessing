function Y = fast_digital_image_inpainting(X, H, k, tol)
  
  % Converting the image to double
  X = im2double(X);
  
  % Converting the mask into binary (in case it is not)
  H = im2bin(H);
  
  do
	% 
	X_prev = X;
    % Convolution between the image and the kernel
    C = conv2(X, k, shape="same");
    % Clearing non-mask pixels information in convolution result
    C(H(:,:) == 0) = 0;
    % Clearing mask pixels information in the original image
    X(H(:,:) == 1) = 0; 
    % Adding the convolution information to the original image
    X += C;
	% 
	error = norm(X - X_prev, 'fro') / norm(X, 'fro');
  until  (error < tol)
  
  Y = X;
  
endfunction