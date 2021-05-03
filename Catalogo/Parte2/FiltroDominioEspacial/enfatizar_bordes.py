import numpy as np
import scipy.signal as sig
from matplotlib import image
from matplotlib import pyplot

# Cargar la imagen
file = input("\nWrite the image path (press enter to default image):\n\n>")
I_color = image.imread(file if file != '' else 'files/Columnas.jpg')
A_ = I_color[:, :, 0] / 255

# Mostrar la imagen original en pantalla
pyplot.subplot(121)
pyplot.imshow(A_, cmap = 'gray')
pyplot.title("Imagen original")

# Aplicar el filtro gaussiano a la imagen A_
B = (1/16) * np.array([[1, 2, 1], [2, 4, 2], [1, 2, 1]])
A_ = np.array(A_)
B = np.array(B)
A = sig.convolve2d(A_, B, 'same')

# Operar la imagen A_
alfa = 15
C = A_ - A
D = A + alfa * C

# Mostrar la imagen con filtro
pyplot.subplot(122)
pyplot.imshow(D, cmap = 'gray')
pyplot.title("Imagen con énfasis en bordes")
pyplot.show()