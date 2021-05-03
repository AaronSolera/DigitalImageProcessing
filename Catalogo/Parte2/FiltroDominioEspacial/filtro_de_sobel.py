import numpy as np
import scipy.signal as sig
from matplotlib import image
from matplotlib import pyplot

# Cargar la imagen
file = input("\nWrite the image path (press enter to default image):\n\n>")
I_color = image.imread(file if file != '' else 'files/child.jpg')
A = I_color[:,:,0] / 255

# Mostrar la imagen original en pantalla
pyplot.subplot(121)
pyplot.imshow(A, cmap = 'gray')
pyplot.title("Imagen original")

# Crear la mascara del filtro de Sobel
Bx = [[-1, -2, -1], [0, 0, 0], [1, 2, 1]]
By = [[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]]
Cx = sig.convolve2d(A, Bx, 'same')
Cy = sig.convolve2d(A, By, 'same')
C = np.sqrt(np.power(Cx, 2) + np.power(Cy, 2))

# Mostrar la imagen con filtro
pyplot.subplot(122)
pyplot.imshow(C, cmap = 'gray')
pyplot.title("Imagen con filtro de Sobel")
pyplot.show()