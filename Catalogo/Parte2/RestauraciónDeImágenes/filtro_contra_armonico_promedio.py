import numpy as np
import scipy.signal as sig
from matplotlib import image
from matplotlib import pyplot

# Cargar la imagen
file = input("\nWrite the image path (press enter to default image):\n\n>")
I_color = image.imread(file if file != '' else 'files/edificio_china.jpg')
A = I_color[:,:,0] / 255

# Mostrar la imagen original en pantalla
pyplot.subplot(131)
pyplot.imshow(A, cmap = 'gray')
pyplot.title("Imagen Original")

# Crear un ruido aditivo
[m, n] = A.shape
N = 0.2 * np.random.randn(m, n)
B = A + N # La imagen con ruido , con valores double normalizados
pyplot.subplot(132)
pyplot.imshow(B, cmap = 'gray')
pyplot.title("Imagen con Ruido")

# Filtro Contra-armónico promedio de orden R

R = 2
At1 = np.zeros((m, n))
for x in range(0, m):
  for y in range(0, n):
    # Pixel a modificar: B(X, Y)
    W1 = 0
    W2 = 0
    for i in range(-1, 1):
      for j in range(-1, 1):
        nx = x + i
        ny = y + j
        if (nx >= 0 & nx <= m) & (ny >= 0 & ny <= n):
          W1 += B[nx, ny]**(R + 1)
          W2 += B[nx, ny]**R
    At1[x, y] = W1 / W2

error = np.linalg.norm(B - At1, 'fro')
pyplot.subplot(133)
pyplot.imshow(At1, cmap = 'gray')
pyplot.title("Imagen con Filtro Contra-armónico promedio de orden R")
pyplot.show()
print("Error del Filtro Contra-armónico promedio de orden R: " + str(error))
