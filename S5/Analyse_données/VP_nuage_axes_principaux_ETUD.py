# -*- coding: utf-8 -*-
"""
Created on Sat Jun  1 18:09:45

@author: ricord
"""

import numpy as np
import matplotlib.pyplot as plt


def visu_nuage(A):
    (ligne, colonne) = np.where(A == 1)  # retourne les indices
    yA = ********************* TO DO ***************************************
    xA = colonne
    plt.plot(xA, yA, 'bo')
    return xA, yA


plt.close('all')

# matrice permettant de positionner des points (changement possible) :
A = np.array([
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 1., 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 0, 0, 1., 1, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 1., 1, 0, 1, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]])


# visualisation de l'image correspondant à cette matrice :
plt.figure()
plt.imshow(A)
# visualisation du nuage des points dans un repère droite-haut classique :
plt.figure()
plt.axis('equal')
(x, y) = visu_nuage(A)
# le centre de gravité :
moy_x = np.mean(x)
moy_y = np.mean(y)
plt.plot(moy_x, moy_y, 'go')


# la matrice de variance-covariance :
varcov = np.cov(x, y)
(VP_val, VP_vec) = np.linalg.eig(varcov)
print('eigen values = ', VP_val)
print('eigen vectors = ')
print(VP_vec)
# longueur des vecteurs propres :
L0 = *********************************** TODO *****************************
L1 = *********************************** TODO *****************************
# visualisation des vecteurs propres :
plt.plot([moy_x, moy_x+ ******* ], [moy_y, moy_y+ ******** ], 'r-')
plt.plot([moy_x, moy_x+ ******* ], [moy_y, moy_y+ ******** ], 'k-')



