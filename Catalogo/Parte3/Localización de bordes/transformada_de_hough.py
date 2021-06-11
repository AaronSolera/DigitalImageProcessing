import numpy as np
import scipy.signal as sig
from matplotlib import image
from matplotlib import pyplot
import cv2

# Cargar la imagen
file = input("\nWrite the image path (press enter to default image):\n\n>")
I_color = image.imread(file if file != '' else 'files/cuadro.jpg')
A = I_color / 255
[m, n] = A.shape

# Mostrar la imagen original en pantalla
# pyplot.subplot(121)
pyplot.imshow(A, cmap = 'gray')
pyplot.title("Imagen con detección de línea")

#A = cv2.resize(A, (int(m/2), int(n/2)))

# Para obtener los bordes de la imagen, utilizaremos el operador de Sobel
Bx = [[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]]
By = [[-1, -2, -1], [0, 0, 0], [1, 2, 1]]
Cx = sig.convolve2d(A, Bx, 'same')
Cy = sig.convolve2d(A, By, 'same')
B = np.sqrt(Cx**2 + Cy**2)

# Convertirla a Binaria
B[B < 0.5] = 0
B[B >= 0.5] = 1

# ax.subplot(122)
# ax.imshow(B, cmap = 'gray')
# ax.title("Bordes")

# Calcular la discretizacion angulo y p
h1 = 1; # Paso entre los angulos
angulos = np.deg2rad(np.arange(0, 180, h1))
[m, n] = B.shape
d = np.sqrt(m**2 + n**2)
h2 = 1; # Paso entre los p
ps = np.arange(-d, d, h2)

# Crear la matriz de acumulacion
m1 = len(angulos)
n1 = len(ps)
Acumulador = np.zeros((m1, n1))

b = np.argwhere(B == 1) # Pares ordenados donde se detectan bordes

for i in range(0, len(b)):
  for ang_ind in range(0, len(angulos)):
    ang = angulos[ang_ind]
    p = b[i][0] * np.cos(ang) + b[i][1] * np.sin(ang)
    p_ind = np.argmin(np.abs(ps - p))
    Acumulador[ang_ind, p_ind] += 1

numlineas = 1

for i in range(0, numlineas):
  # Encontrar la posición donde el Acumulador alcanza el máximo
  maxA = np.max(np.max(Acumulador))
  p = np.argwhere(Acumulador == maxA)

  for k in range(0, len(p)):
    # Graficar la linea rectangle
    angMax = angulos[p[k][0]]
    pMax = ps[p[k][1]]

    if (np.abs(np.sin(angMax)) < (10**(-4))):
      x_v = pMax / np.cos(angMax)
      pyplot.plot([n, 1], [x_v, x_v], color="blue", linewidth=3)
    else:
      # Calcular pendiente 
      pendiente = -np.cos(angMax)/np.sin(angMax)
      interseccion = pMax / np.sin(angMax)
      # Necesitamos el punto (1,y1) 
      y1 = pendiente*1 + interseccion
      # Necesitamos el punto (m,ym) 
      ym = pendiente*m + interseccion 
      # Necesitamos el punto (x1,1) 
      x1 = (1-interseccion) / pendiente 
      # Necesitamos el punto (xn,n) 
      xn = (n-interseccion) / pendiente
      if (pendiente>0):
        if (0 < y1):
          pyplot.plot([y1, n], [1, xn], color="blue", linewidth=1)
        else:
          pyplot.plot([1, ym], [x1, m], color="blue", linewidth=1)
      elif (y1 > m):
        pyplot.plot([ym, n], [m, xn], color="blue", linewidth=1)
      else: 
        pyplot.plot([y1, 1], [1, x1], color="blue", linewidth=1) 
    Acumulador[p[k][0], p[k][1]] = 0

pyplot.show()