# -*- coding: utf-8 -*-
"""
Created on Wed Sep 11 00:01:19 2024

@author: ricord
"""

# -*- coding: utf-8 -*-
"""
Created on Tue Sep 10 18:13:15 2024

@author: ricord
"""

import numpy as np
import matplotlib.pyplot as plt


def visudroite(xmin, xmax, param, s):
    a0 = param[0, 0]
    a1 = param[1, 0]
    plt.plot([xmin, xmax], [a0+a1*xmin, a0+a1*xmax], s)

# plt.title('$a^{goal}$ =  %1.3f , $b^{goal}$ =  %1.3f' % (ca, cb))


plt.close('all')

# simuler n points autour d'une droite :

n = 20
dataX = np.random.normal(0, 4, n)
xmin, xmax = min(dataX), max(dataX)  # pour la visu

eps = np.random.normal(0, 1.5, n)  # bruit aleatoire
dataY = (dataX*2 + 1) + eps

dataY = np.array(dataY).reshape((n, 1))

# résoudre  A*param = y  en utilisant la méthode des moindres carrés

matA = np.zeros((n, 2))
matA[:, 0] = np.ones(n)
matA[:, 1] = A COMPLETER **********************************************

# equations normales :
param = A COMPLETER ***************************************************

# visualisation :
plt.figure()
plt.plot(dataX, dataY, 'ro')
visudroite(xmin, xmax, param, 'k')

