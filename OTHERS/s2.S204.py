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

d = open('fichier_1.csv')
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
plt.title('Nuage de points des listes: L1 & L2')
plt.xlabel('x (L1)')
plt.ylabel('y (L2)')"""

"""plt.scatter(donnéesL1, donnéesL3)
plt.title('Nuage de points des listes: L1 & L3')
plt.xlabel('x (L1)')
plt.ylabel('y (L3)')"""

"""plt.scatter(donnéesL1, donnéesL4)
plt.title('Nuage de points des listes: L1 & L4')
plt.xlabel('x (L1)')
plt.ylabel('y (L4)')"""

"""plt.scatter(donnéesL2, donnéesL3)
plt.title('Nuage de points des listes: L2 & L3')
plt.xlabel('x (L2)')
plt.ylabel('y (L3)')"""

"""plt.scatter(donnéesL2, donnéesL4)
plt.title('Nuage de points des listes: L2 & L4')
plt.xlabel('x (L2)')
plt.ylabel('y (L4)')"""

"""plt.scatter(donnéesL3, donnéesL4)
plt.title('Nuage de points des listes: L3 & L4')
plt.xlabel('x (L3)')
plt.ylabel('y (L4)')"""





d.close()
