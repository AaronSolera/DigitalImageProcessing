import math
import numpy as np
import matplotlib.pyplot as plt

def read_image(filename):
    return plt.imread(filename)

def compare_images(img1, img2, title1, title2, cmap=None):
    fig, (ax1, ax2) = plt.subplots(1,2)
    ax1.imshow(img1, cmap=cmap)
    ax1.set_title(title1)
    ax2.imshow(img2, cmap=cmap)
    ax2.set_title(title2)
    plt.show()

def uint8(X):
    return np.uint8(np.clip(X+0.5,0,255))

def median_filter(X, window_size: tuple):
    # Initializes the output image
    Y = np.zeros(X.shape)
    m, n = X.shape
    neighborhood = None
    median = None
    ik = window_size[0] // 2
    jk = window_size[1] // 2
    i_median = window_size[0]*window_size[1] // 2
    # Go through all rows
    for i in range(m):
        # Go through all columns
        for j in range(n):
            # If the current pixel is no an edge pixel and the pixel is black
            if ((i > 0 and i < m-ik) and (j > 0 and j < n-jk)) and (X[i][j] == 0):
	            # Gets the neighborhood of the current pixel
	            neighborhood = X[i-ik:(i-ik)+window_size[0], j-jk:(j-jk)+window_size[1]]
	            # Sorts the neighborhood items
	            neighborhood = np.sort(neighborhood, axis=None)
	            # Gets the median value of the neighborhood
	            median = neighborhood[i_median]
            else:
                # Gets the value of the current edge pixel
                median = X[i][j]
            # Saves the value in the output image
            Y[i][j] = int(median)
    return Y

def rotation(X, theta):

	m, n = X.shape
	Y = np.zeros((m,n))

	xc = np.floor(m / 2)
	yc = np.floor(n / 2)

	a0 = math.cos(theta)
	a1 = math.sin(theta)
	a2 = xc - a0 * xc - a1 * yc;

	b0 = -math.sin(theta)
	b1 = math.cos(theta)
	b2 = yc - b0 * xc - b1 * yc

	for x in range(m):
		for y in range(n):
			xt = int(np.round(a0 * x + a1 * y + a2) + 1);
			yt = int(np.round(b0 * x + b1 * y + b2) + 1);

			if xt > 0 and yt > 0:
				if xt < m and yt < n:
					Y[xt, yt] = X[x, y]

	Y = median_filter(Y, window_size=(3,3))

	return Y

def rotation_rgb(X, theta):
    """
    Function that performs the rotation of an image

    Parameters
    ----------
    X : array_like
        Input image array (with noise)

    Returns
    -------
    B : ndarray
        The resulting matrix of the transformation (clean)
    """
    X = np.array(X).astype(np.float64)
    Y = np.zeros(X.shape)
    _, _, z = X.shape

    for c in range(z):
        Y[:,:,c] = rotation(X[:,:,c], theta)

    Y = uint8(Y)

    return Y


I = read_image('imagen1.jpg')

Y = rotation_rgb(I, theta=math.pi/4)

compare_images(I, Y, "Imagen sin rotación", "Imagen con rotación")
