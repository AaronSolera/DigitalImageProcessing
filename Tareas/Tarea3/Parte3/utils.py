import numpy as np
import matplotlib.pyplot as plt


def read_image(filename):
    return plt.imread(filename)


def show_1bin_image(X, title):
    plt.imshow(X, cmap=plt.cm.gray)
    plt.title(title)
    plt.show()


def show_2bin_images(img1, img2, title1, title2, cmap=plt.cm.gray):
    fig, (ax1, ax2) = plt.subplots(1, 2)
    ax1.imshow(img1, cmap=cmap)
    ax1.set_title(title1)
    ax2.imshow(img2, cmap=cmap)
    ax2.set_title(title2)
    plt.show()


def show_3bin_images(img1, img2, img3, title1, title2, title3, cmap=plt.cm.gray):
    fig, (ax1, ax2, ax3) = plt.subplots(1, 3)
    ax1.imshow(img1, cmap=cmap)
    ax1.set_title(title1)
    ax2.imshow(img2, cmap=cmap)
    ax2.set_title(title2)
    ax3.imshow(img3, cmap=cmap)
    ax3.set_title(title3)
    plt.show()


def plot_image(X, cmap=None):
    plt.imshow(X, cmap=cmap)
    plt.show()


def compare_images(img1, img2, title1, title2, cmap=plt.cm.gray):
    fig, (ax1, ax2) = plt.subplots(1, 2)
    ax1.imshow(img1, cmap=cmap)
    ax1.set_title(title1)
    ax2.imshow(img2, cmap=cmap)
    ax2.set_title(title2)
    plt.show()


def im2double(X):
    # Get the data type of the input image
    info = np.iinfo(X.dtype)
    # Divide all values by the largest possible value in the datatype
    return X.astype(np.float) / info.max


def im2uint8(X):
    return np.uint8(np.clip(X+0.5, 0, 255))


def rgb2gray(X):
    return np.dot(X[..., :3], [0.2989, 0.5870, 0.1140])


def im2bin(X, threshold=0.5):
    return (X >= threshold).astype("uint8")
