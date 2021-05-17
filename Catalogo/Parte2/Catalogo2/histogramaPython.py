import numpy as np
import math
import matplotlib.pyplot as plt
import matplotlib.image as img

#crear histograma de la imágen
def histograma(m, n, image):
    result = np.zeros(256)
    #print(image)
    for x in image:
    	for y in x:
    		result[y] +=1
    return result

#generar eje x
def generateX():
	datos = np.zeros(256)
	cont = 0
	for x in range(256):
		datos[x] = cont
		cont +=1 
	return datos

# Cargar la imagen
image = img.imread('peppers.jpg')
m,n = image.shape
m -= 1
n -= 1

plt.subplot(221)
plt.imshow(image, cmap = 'gray')
plt.title("Imagen Original")

#mostrar el histograma generado
datos = generateX()
result = histograma(m,n,image)
plt.subplot(222)
plt.bar(datos,result)
plt.show()


