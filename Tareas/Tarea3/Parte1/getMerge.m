function fondo = getMerge(A, B)
  [m, n,dim] = size(A)
  #Obtenemos los componentes RGB de la imágen 2 a mesclar
  Br= uint8(B(:,:,1));
  Bg= uint8(B(:,:,2));
  Bb= uint8(B(:,:,3));
  #Realizamos una copia para sobre escritura de la imagen
  R = uint8(A(:,:,1));
  G = uint8(A(:,:,2));
  B = uint8(A(:,:,3));
  #Mesclamos los componentes RGB de la imágen A y la imágen B
  #La operación and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50)) se utiliza de filtro para saber que componentes
  #de la imágen A deben ser reemplazdos por la  imágen B se hace esto para todos los pixeles RGB
  #Utiliza ANDs anidados para validar
  R(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))) = uint8(Br(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))));
  G(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))) = uint8(Bg(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))));
  B(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))) = uint8(Bb(and(A(:,:,1) < 50, and(A(:,:,2) > 200, A(:,:,3) < 50))));

  #Creamos la matriz Resultante con ceros
  fondo = uint8(zeros(m,n,dim));

  #Se combinan los tres componentes de la imágen en la imágen final C
  fondo(:,:,1) = R;
  fondo(:,:,2) = G;
  fondo(:,:,3) = B;
endfunction