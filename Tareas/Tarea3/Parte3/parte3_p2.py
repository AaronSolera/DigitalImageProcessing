from utils import *
from hough_circles import *
import numpy as np
import cv2 as cv

# Reads the input image
img1 = (read_image("imagen1.png")[:, :, 0]*255).astype("uint8")
img2 = (read_image("imagen2.png")[:, :, 0]*255).astype("uint8")
img3 = (read_image("imagen3.png")[:, :, 0]*255).astype("uint8")

# Applies low-pass filter for smoothing (Gaussian)
img1_gauss = cv.GaussianBlur(src=img1, ksize=(7, 7), sigmaX=0)
img2_gauss = cv.GaussianBlur(src=img2, ksize=(7, 7), sigmaX=0)
img3_gauss = cv.GaussianBlur(src=img3, ksize=(7, 7), sigmaX=0)

# Applies high-pass filter for edge detection (Canny)
img1_edges = cv.Canny(image=img1_gauss, threshold1=150, threshold2=175)
img2_edges = cv.Canny(image=img2_gauss, threshold1=125, threshold2=150)
img3_edges = cv.Canny(image=img3_gauss, threshold1=150, threshold2=175)

# Gets the points (x,y) where the edges are located
B1 = np.argwhere(img1_edges == 255).astype("uint8")
B2 = np.argwhere(img2_edges == 255).astype("uint8")
B3 = np.argwhere(img3_edges == 255).astype("uint8")

# Applies Hough algorithm for circle detection
img1_circles = hough_circles(img1, B1, threshold=0.6)
img2_circles = hough_circles(img2, B2, threshold=0.5)
img3_circles = hough_circles(img3, B3, threshold=0.7)

# Shows results
cv.imshow("Image 1", np.concatenate((img1, img1_circles), axis=1))
cv.imshow("Image 2", np.concatenate((img2, img2_circles), axis=1))
cv.imshow("Image 3", np.concatenate((img3, img3_circles), axis=1))

cv.waitKey(0)
cv.destroyAllWindows()
