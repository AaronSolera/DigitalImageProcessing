import numpy as np
from matplotlib import image
from matplotlib import pyplot

def rango_reducido_bilateral(A, r, p):
    # Paso 1
    # Numero de columnas de A
    n = A.shape[1] 
    Y2 = np.random.rand(n, r)
    # Paso 2
    for _ in range(0, p):
        Y1 = np.dot(A, Y2)
        Y2 = np.dot(np.transpose(A), Y1)
    # Paso 3
    # Y2 = QR, Q = Ortogonal, R = Triangular Superior
    Q, _ = np.linalg.qr(Y2)
    # Paso 4
    Qr = Q[:, 0:r]
    # Paso 5
    B = np.dot(A, Qr)
    C = np.transpose(Qr)
    return [B, C]

# Cargar la imagen
file = input("\nWrite the image path (press enter to default image):\n\n>")
I_color = image.imread(file if file != '' else 'files/img1.jpg')
A = I_color[:,:,0] / 255
# Definir rango de 200. Puede darse otro rango
r = 200
# Aplicar funcion de rango reducido bilateral
[B, C] = rango_reducido_bilateral(A, r, 3)
# Guardando las dos matrices en archivos
np.save('B.npy', B)
np.save('C.npy', C)
# Matriz de rango reducido usando proyeccion bilateral
Ar = np.dot(B, C)
# Mostrar la imagen original en pantalla
pyplot.subplot(121)
pyplot.imshow(A, cmap = 'gray')
pyplot.title("Imagen Original")
# Mostrar la imagen comprimida con rango reducido bilateral producto de B y C en pantalla
pyplot.subplot(122)
pyplot.imshow(Ar, cmap = 'gray')
pyplot.title("Imagen Rango Reducido Bilateral")
pyplot.show()