import math
import numpy as np
import cv2 as cv


def hough_circles(image, B, threshold=0.5):
    """ 
    Function that calculates the Hough transform for multiple circles detection

    Args:
        image : ndarray
            Input image
        B : ndarray
            List of points where the edges are located
        threshold : float (optional)
            Threshold to make the voint process for circle detection. Defaults to 0.5.

    Returns:
        ndarray:
            Binary image with the circles drawn
    """

    M, N = image.shape
    p = int(math.sqrt(M**2 + N**2))
    P = np.zeros((M, N, p))

    # Starts the voting process
    for k in range(len(B)):
        xi = B[k][0]
        yi = B[k][1]
        for a in range(M):
            for b in range(N):
                r = int(math.sqrt((xi-a)**2 + (yi-b)**2))
                if (r > 0 and r < p):
                    P[a, b, r] += 1/(2*math.pi*r)

    # Gets the points (x,y,r) greater than threshold
    points = np.where(P > threshold)
    points = np.column_stack((points[1], points[0], points[2]))

    # Draws the detected circles in blank image
    circles = np.zeros((M, N), dtype="uint8")
    for i in range(len(points)):
        a = points[i][0]
        b = points[i][1]
        r = points[i][2]
        cv.circle(img=circles, center=(a, b),
                  radius=r, color=(255, 255, 255), thickness=1)

    return circles
