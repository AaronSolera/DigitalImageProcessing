clc; clear; close all

pkg load image;
pkg load video;

% Ejemplo de video

clc; clear; close all

pkg load image
pkg load video

V = VideoReader('files/video.mp4');
fr = V.NumberOfFrames; % Número de Frames (Imágenes)
m = V.Height; % Número de Filas
n = V.Width; % Número de Columnas

O = zeros(m, n, 3, fr); % Matriz que representa el archivo de video original
S = zeros(m, n, 3, fr); % Matriz que representa el archivo video_skin_detected
t = 0; % Guardar tiempo

cb_th = 77.127;
cr_th = 130.173;
M = strel('diamond', 1);

for k = 1 : fr * 0.9
  tic
  % Paso 1: Obtener el frame actual del video
  F = readFrame(V);
  % Paso 2: Conversión del espacio de color RGB a YCbCr
  YCBCR = rgb2ycbcr(F);
  % Paso 3: Obtener la matriz binaria con los datos Cb y Cr de la matriz YCBCR con valores mayores a 77.127 y 130.173 respectivamente 
  CB = YCBCR(:,:,2); 
  CR = YCBCR(:,:,3); 
  B1 = (CB > cb_th);
  B2 = (CR > cr_th);
  B = B1 & B2;
  % Paso 4:Aplicar una opreación morfológica de erosión y dilatación
  B = imerode(B, M);
  B = imdilate(B, M);
  B = medfilt2(B); % Filtrar la imagen para eliminar posibles ruidos
  B = uint8(B);
  % Paso 5: Multiplicar la imagen del frame original por la máscara para dejar únicamente los pixeles detectados como piel
  S(:,:,1,k) = F(:,:,1) .* B;
  S(:,:,2,k) = F(:,:,2) .* B;
  S(:,:,3,k) = F(:,:,3) .* B;
  t += toc;
  % Guardar video original
  O(:,:,:,k) = F;
  % Mostrar progreso
  disp(["Progress: " num2str((k/fr) * 100) "%, " num2str(((t/k) * ((fr * 0.9) - k)) / 60) " minutes left"]);
  % Mostrar frame actual original y procesado
  subplot(1,2,1)
  imshow(uint8(F))
  title("Video Original")
  subplot(1,2,2)
  imshow(uint8(S(:, :, :, k)))
  title("Detección de piel")
  pause(0.00001)
end

% La matriz Y tiene la información del video
% Crear el video
video = VideoWriter('files/video_skin_detected.mp4');

for i = 1 : fr
  writeVideo(video, [O(:,:,:,i) S(:,:,:,i)]);
endfor

close(video)