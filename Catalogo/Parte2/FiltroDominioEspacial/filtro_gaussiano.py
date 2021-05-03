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

# Crear la mascara del filtro gaussiano
B = (1/16) * np.array([[1, 2, 1], [2, 4, 2], [1, 2, 1]])
A = np.array(A)
B = np.array(B)
C = sig.convolve2d(A, B, 'same')

# Mostrar la imagen con filtro
pyplot.subplot(122)
pyplot.imshow(C, cmap = 'gray')
pyplot.title("Imagen con filtro gaussiano")
pyplot.show()