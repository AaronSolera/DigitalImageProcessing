function [border,image] = getBorder(A)
  [m,n,dim] = size(A);
  border = zeros(m,n);
  border(and(A(:,:,1) < 120, and(A(:,:,2) > 120, A(:,:,3) < 120))) = 1;
  image = zeros(m,n,dim);
  image(:,:,1) = fast_digital_image_inpainting(A(:,:,1), border, 1000);
  image(:,:,2) = fast_digital_image_inpainting(A(:,:,2), border, 1000);
  image(:,:,3) = fast_digital_image_inpainting(A(:,:,3), border, 1000);
  
endfunction