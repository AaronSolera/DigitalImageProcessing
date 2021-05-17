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
    		result[int(y)] +=1
    return result

#generar eje x
def generateX():
	datos = np.zeros(256)
	cont = 0
	for x in range(256):
		datos[x] = cont
		cont +=1 
	return datos

def getLimit(histogramaOriginal):
	cont = 0;
	minimo = 0
	maximo = 0
	for i in histogramaOriginal:
		if i != 0 and minimo ==0:
			minimo = cont
		if i != 0:
			maximo = cont
		cont += 1
	return minimo,maximo

# Cargar la imagen
image = img.imread('peppers.jpg')
m,n = image.shape
m -= 1
n -= 1

plt.subplot(221)
plt.imshow(image, cmap = 'gray')
plt.title("Imagen original")

#mostrar el histograma generado
datos = generateX()
histogramaOriginal = histograma(m,n,image)
print(histogramaOriginal)
plt.subplot(222)
plt.bar(datos,histogramaOriginal)


minimo,maximo = getLimit(histogramaOriginal)
print(minimo)
print(maximo)
B = np.zeros((m,n))
for i in range(m):
	for j in range(n):
		B[i,j] = (255/(maximo-minimo))*(image[i,j]-minimo)

plt.subplot(223)
plt.imshow(B, cmap = 'gray')
plt.title("Imagen estirada")


histogramaNuevo = histograma(m,n,B)
print(histogramaNuevo)
plt.subplot(224)
plt.bar(datos,histogramaNuevo)

plt.show()