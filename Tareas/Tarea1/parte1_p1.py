import matplotlib.pyplot as plt
import numpy as np

def read_image(filename):
    return plt.imread(filename)

def compare_images(img1, img2, title1, title2, cmap=None):
    fig, (ax1, ax2) = plt.subplots(1,2)
    ax1.imshow(img1, cmap=cmap)
    ax1.set_title(title1)
    ax2.imshow(img2, cmap=cmap)
    ax2.set_title(title2)
    plt.show()

def rgb2gray(X):
    return np.dot(X[...,:3], [0.2989, 0.5870, 0.1140])

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
            # If the current pixel is no an edge pixel
            if ((i > 0 and i < m-ik) and (j > 0 and j < n-jk)):
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

def median_filter_rgb(X, window_size=(3,3)):
    """
    Function that calculates the median filter on and 
    image to reduce their noise

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
        Y[:,:,c] = median_filter(X[:,:,c], window_size=(3,3))

    Y = uint8(Y)

    return Y

I = read_image("imagen1.jpg") 

Y = median_filter_rgb(I, window_size=(3,3))

compare_images(I, Y, "Imagen con ruido", "Imagen sin ruido")
