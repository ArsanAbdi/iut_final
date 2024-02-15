#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Mar  8 18:45:38 2023

@author: arsanabdi
"""
import csv
import numpy as np
import matplotlib.pyplot as plt
import numpy.random as alea

"""----------------- ASSOCIATION DE CHAQUE LIGNE À UNE LISTE ----------------"""

d = open('val.csv')
D = csv.reader(d, delimiter = ';')

L1 = []
x = D.__next__()

for i in range(len(x)):
    L1.append(float(x[i]))
    
L2 = []
x = D.__next__()

for i in range(len(x)):
    L2.append(float(x[i]))
    
L3 = []
x = D.__next__()

for i in range(len(x)):
    L3.append(float(x[i]))
    
L4 = []
x = D.__next__()

for i in range(len(x)):
    L4.append(float(x[i]))
    
"""---------- MÉTHODE RETOURNANT LES INFOS SUR LES VARIABLES ------------"""    
    
donnéesL1 = np.array(L1)
donnéesL2 = np.array(L2)
donnéesL3 = np.array(L3)
donnéesL4 = np.array(L4)

def calculs(tab):
    """formule de la moyenne"""
    moyenne = np.sum(tab) / len(tab)
    print(moyenne)
    print("\t")
    
    """formule de la variance"""
    variance = (np.sum(tab**2) / len(tab)) - moyenne**2
    print(variance)
    print("\t")
    
    """formule de l'écart-type'"""
    ecarttype = variance**(1/2)
    print(ecarttype)
    
def moyenne(data):   
    n = len(data)
    moy = np.sum(data)/n
    return moy

def variance(data):  
    var = moyenne(data*data) - moyenne(data)**2
    return var

def covariance(dataX,dataY):  
    cov = moyenne(dataX*dataY) - moyenne(dataX)*moyenne(dataY)
    return cov

def visu_histo(data, s):
    moy = moyenne(data)
    sig = np.sqrt(variance(data))
    # visualisation de l'histogramme :
    plt.figure()
    plt.hist(data, bins=20, density=True, edgecolor='k')
    plt.title('histogramme de %s , moy = %1.3f,  $\sigma$ = %1.3f' \
              % (s, moy, sig)) 
        
def droiteRegression(datax,datay):
	# coefficient de la droite de regression :
	a = covariance(datax, datay)/variance(datax)
	b = moyenne(datay) - moyenne(datax)*a
	xmin, xmax = min(datax), max(datax)
	plt.plot([xmin, xmax],[a*xmin+b, a*xmax+b], 'k-')   	
        

"""------------------------------QUEST.1---------------------------------"""
    

"""PREMIERE LIGNE
plt.hist(L1, range = (min(L1), max(L1)), edgecolor = 'black', color = 'yellow')
plt.xlabel('valeurs')
plt.ylabel('fréquence')
plt.title('Histogramme de la liste: L1')
plt.xticks(range(-40, 70, 5))
plt.yticks(range(0, 35, 2))
plt.show()

print(calculs(donnéesL1))"""

"""DEUXIEME LIGNE
plt.hist(L2, range = (min(L2), max(L2)), edgecolor = 'black', color = 'orange')
plt.xlabel('valeurs')
plt.ylabel('fréquence')
plt.title('Histogramme de la liste: L2')
plt.xticks(range(-15, 15, 1))
plt.yticks(range(0, 22, 2))
plt.show()

print(calculs(donnéesL2))"""

"""TROISIEME LIGNE
plt.hist(L3, range = (min(L3), max(L3)), edgecolor = 'black', color = 'red')
plt.xlabel('valeurs')
plt.ylabel('fréquence')
plt.title('Histogramme de la liste: L3')
plt.xticks(range(-3, 3, 1))
plt.yticks(range(0, 18, 2))
plt.show()

print(calculs(donnéesL3))"""

"""QUATRIEME LIGNE
plt.hist(L4, range = (min(L4), max(L4)), edgecolor = 'black', color = 'green')
plt.xlabel('valeurs')
plt.ylabel('fréquence')
plt.title('Histogramme de la liste: L4')
plt.xticks(range(-5, 15, 1))
plt.yticks(range(0, 35, 2))
plt.show()

print(calculs(donnéesL4))"""


"""------------------------------QUEST.2---------------------------------"""

"""plt.scatter(donnéesL1, donnéesL2)
plt.title('Nuage de points des variables: x & y')
plt.xlabel('x')
plt.ylabel('y')
droiteRegression(donnéesL1, donnéesL2)"""

"""plt.scatter(donnéesL1, donnéesL3)
plt.title('Nuage de points des variables: x & z')
plt.xlabel('x')
plt.ylabel('z')
droiteRegression(donnéesL1, donnéesL3)"""

"""plt.scatter(donnéesL1, donnéesL4)
plt.title('Nuage de points des variables: x & w')
plt.xlabel('x')
plt.ylabel('w')
droiteRegression(donnéesL1, donnéesL4)"""

"""plt.scatter(donnéesL2, donnéesL3)
plt.title('Nuage de points des variables: y & z')
plt.xlabel('y')
plt.ylabel('z')
droiteRegression(donnéesL2, donnéesL3)"""

"""plt.scatter(donnéesL2, donnéesL4)
plt.title('Nuage de points des variables: y & w')
plt.xlabel('y')
plt.ylabel('w')
droiteRegression(donnéesL2, donnéesL4)"""

"""plt.scatter(donnéesL3, donnéesL4)
plt.title('Nuage de points des variables: z & w')
plt.xlabel('z')
plt.ylabel('w')
droiteRegression(donnéesL3, donnéesL4)"""





d.close()
