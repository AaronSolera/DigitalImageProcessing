
function Y = fast_digital_image_inpainting(X, H, iters=10)#x la imágen #H la mascara 
  
  a = 0.073235;
  b = 0.176765;
  c = 0.125;

  % Defining the first diffusion kernel
  k1 = [ a b a ;
         b 0 b ;
         a b a ];
         
  
  % Converting the image to double
  X = im2double(X);
  
  % Converting the mask into binary (in case it is not)
  H = im2bin(H);
  
  for i = 1:iters
    % Convolution between the image and the kernel
    C = conv2(X, k1, shape="same");
    % Clearing non-mask pixels information in convolution result
    C(H(:,:) == 0) = 0;
    % Clearing mask pixels information in the original image
    X(H(:,:) == 1) = 0; 
    % Adding the convolution information to the original image
    X += C;
  end
  
  Y = X;
  
endfunction


