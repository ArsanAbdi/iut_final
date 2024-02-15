# -*- coding: utf-8 -*-
"""
Created on Sun Feb  5 19:18:55 2023

@author: ricord
"""

# -*- coding: utf-8 -*-

# TP semaine-2  (2022-2023 ) sattistique descriptive  R2.08

import numpy as np  
import matplotlib.pyplot as plt
import numpy.random as alea

plt.close('all')

#---------------------------------------------------------------

def moyenne(data):   
    n = len(data)
    moy =   # TODO
    return moy

def variance(data):  
    var =   # TODO
    return var

def covariance(dataX,dataY):  
    # TODO
    return cov

#---------------------------------------------------------------
# une méthode qui affiche le diagramme en bâtons :
#---------------------------------------------------------------

def diagramme_baton(data, string):
    # data est un tableau numpy
    
    # We can convert the numpy array to a list and then use 
    # the count() function of list to get the count of occurrences
    #  of an element in it :
        
    datalist = data.tolist()
    valeur = sorted(set(datalist))  
    effectif = np.zeros(len(valeur)) # initialise le tableau
    
    for k in np.arange(len(valeur)) :
        effectif[k] = datalist.count(valeur[k])  
    
    # Afficher le diagramme en bâtons :

    plt.bar(valeur, effectif, width = 0.1, color = string)   


#---------------------------------------------------------------
# exercice-1
# travail à faire dans IPython pour manipuler un tableau numpy


#---------------------------------------------------------------
# exercice-2
# un caractère (ou variable) X 
# visualisation des données, calcul des paramètres
#---------------------------------------------------------------

# un tableau numpy contenant les données :
dataX = np.array([ 1., 2, 1, 0, 0, 1, 1, 2, 5, 5 ])

n = len(dataX)
print('data ', dataX, ' , n = ', n)

# Afficher le diagramme en bâtons :
    
plt.figure()  # nouvelle figure
plt.xlabel('valeur')
plt.ylabel('effectif') 
diagramme_baton(dataX, 'red') 

# calculer la moyenne , la variance et l'écart-type :

moy = moyenne(dataX)
print('moyenne = ', moy)
var = variance(dataX)
print('variance = ', var)
print('ecart-type = ', completer avec une formule) # TODO
print(' ')

# transformation des données  dataX --> dataY
    
#dataY =     # TODO

diagramme_baton(dataY, 'blue') 

print('moyenne = ', moyenne(dataY))
var = variance(dataY)
print('variance = ', var)
print('ecart-type = ', completer avec une formule) # TODO
print(' ')

#---------------------------------------------------------------
# exercice-3
# simulation d'un nuage de n points représentant des données (x,y)
# calcul de la covariance de (X,Y) , visualisation du centre
#---------------------------------------------------------------
n = 200

m = 2
sigma = 4
dataX = alea.normal(m, sigma, n) 
moyX =moyenne(dataX)

# visualisation de l'histogramme de dataX (X) :
    
plt.figure()
plt.hist(dataX,bins=20, density=True, edgecolor='k')
plt.title('histogramme de dataX ,   moy = %1.3f' % moyX)  # f represents a float

     
dataY = alea.normal(0, 2, n) 

# calcul de la covariance et
# visualisation du nuage des points (x,y) :

covXY = covariance(dataX,dataY)
print('cov (1) = ', covXY)

plt.figure()
plt.plot(dataX, dataY, 'ro')  # color = 'red', marker = 'o'
plt.xlabel('valeur de x')
plt.ylabel('valeur de y')
plt.title('covariance =  %1.3f' % covXY) # f represents a float

# visualisation du centre :
    
#centreX =    # TODO
#centreY = 
#plt.plot(centreX,centreY,'b^')

#---------------------------------------------------------------
# recommençons, mais cette fois en proposant une formule pour dataY
# qui permette d'avoir une covariance plus importante et négative
#---------------------------------------------------------------
nombre = 100
m = 0
sigma = 2
dataX = alea.normal(m, sigma, nombre) 

#dataY =   # TODO

# on AJOUTE une petite perturbation aléatoire :
    
epsilon = alea.normal(0, 1, nombre) 

dataY = dataY + 1.1*epsilon

covXY = covariance(dataX,dataY)
print('cov (2) = ', covXY)

plt.figure()
plt.plot(dataX, dataY, 'ro')  # color = 'red', marker = 'o'
plt.xlabel('valeur de x')
plt.ylabel('valeur de y')
plt.title('covariance =  %1.3f' % covXY) # f represents a float

#centreX =    # TODO
#centreY = 
#plt.plot(centreX,centreY,'b^')



# fin du TP






# #---------------------------------------------------------------
# # un tableau numpy contenant des données simulées :
# # ( des entiers compris entre xmin et xmax, xmax inclus )
# nb_individu = 100
# xmin = 0
# xmax = 10
# data2 = alea.random_integers(xmin, xmax, nb_individu)  
    

#plt.scatter(dataX, dataY, color = 'red', marker = 'o')   





