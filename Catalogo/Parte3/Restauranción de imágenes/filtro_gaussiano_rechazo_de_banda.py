import numpy as np
import scipy.signal as sig
from matplotlib import image
from matplotlib import pyplot

# Cargar la imagen
file = input("\nWrite the image path (press enter to default image):\n\n>")
I_color = image.imread(file if file != '' else 'files/image1.jpg')
# Normalizar imagen
A = I_color / 255

# Mostrar la imagen original en pantalla
pyplot.subplot(221)
pyplot.imshow(A, cmap = 'gray')
pyplot.title("Imagen original con ruido periódico")

def D(m, n, u, v):
  return np.sqrt((u-(m/2))**2 + (v-(n/2))**2)

[m, n] = A.shape
# Aplicarle la transformada rápida de fourier a la imagen con ruido
Fa = np.fft.fft2(A)

# Crear la mascara
Hbr = np.ones((m, n))
D0 = 100
W = 100
for u in range(0, m):
  for v in range(0, n):
    if D0 - W/2 < D(m, n, u, v) and D(m, n, u, v) <= D0 + W/2:
      Hbr[u][v] = 1 - np.exp(-(D(m, n, u, v)**2)/(2*D0**2))

pyplot.subplot(222)
pyplot.imshow(Hbr, cmap = 'gray')
pyplot.title("Mascara")

# Aplicar multiplicacion puntual
Fa = np.fft.fftshift(Fa)
Fa_ = np.multiply(Fa, Hbr)
pyplot.subplot(223)
pyplot.imshow(np.abs(Fa_), cmap = 'gray')
pyplot.title("Imagen con FFT2D")

# Aplicar transformada rápida inversa de fourier
A_ = np.fft.ifft2(Fa_)
A_ = np.abs(A_)

pyplot.subplot(224)
pyplot.imshow(A_, cmap = 'gray')
pyplot.title("Imagen filtrada")
pyplot.show()