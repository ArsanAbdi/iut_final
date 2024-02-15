"""
@Auteur : Fabien

https://adventofcode.com/2017/day/2

=> Les puzzle fourni on été considéré comme des tuples de int.

=> Chacune des fonctionalités seront ordonnées de la moins "pythonesque" à la plus "pythonesque"


_____PARTIE 1 :_____


Pour chaque ligne, déterminez la différence entre la plus grande valeur et la plus petite valeur ; 
la somme de contrôle est la somme de toutes ces différences.

Par exemple, étant donné la feuille de calcul suivante :

5 1 9 5
7 5 3
2 4 6 8
Les valeurs les plus grandes et les plus petites de la première ligne sont 9 et 1, et leur différence est 8.
Les valeurs les plus grandes et les plus petites de la deuxième ligne sont 7 et 3, et leur différence est 4.
La différence de la troisième ligne est 6.
Dans cet exemple, la somme de contrôle de la feuille de calcul serait 8 + 4 + 6 = 18.

"""


# Importation lié aux hint type des objets :Callable, List et Any
from typing import Callable, List, Any


def somme_controlev1(feuille_calcul: List[List[int]]) -> int:
	"""
	Calcule la somme des différences entre le maximum et le minimum de chaque ligne
	dans une feuille de calcul.

	Args:
		feuille_calcul (list): Une liste de listes représentant une feuille de calcul.

	Returns:
		int: La somme des différences entre le maximum et le minimum de chaque ligne.
	"""
	somme = 0

	for ligne in feuille_calcul :
		minimum = ligne[0]
		maximum = ligne[0]

		for valeur in ligne :
			if valeur < minimum : 
				minimum = valeur

			elif valeur > maximum :
				maximum = valeur

		somme += maximum - minimum
	return somme


# => Utilisation des fonctions existantes
def somme_controlev2(feuille_calcul: List[List[int]]) -> int:
	"""
	Calcule la somme des différences entre le maximum et le minimum de chaque ligne
	dans une feuille de calcul.

	Args:
		feuille_calcul (list): Une liste de listes représentant une feuille de calcul.

	Returns:
		int: La somme des différences entre le maximum et le minimum de chaque ligne.
    """
	somme = 0

	for ligne in feuille_calcul :
		somme += max(ligne) - min(ligne)
	return somme


# => Version + Opti
def somme_controlev3(feuille_calcul: List[List[int]]) -> int:
	"""
	Calcule la somme des différences entre le maximum et le minimum de chaque ligne
	dans une feuille de calcul.

	Args:
		feuille_calcul (list): Une liste de listes représentant une feuille de calcul.

	Returns:
		int: La somme des différences entre le maximum et le minimum de chaque ligne.
    """
	somme = 0
	for ligne in feuille_calcul :
		ligne = sorted(ligne) # tri de la liste par ordre croissant
		somme += ligne[-1] - ligne[0] # [dernier élément] - [premier élément]
	return somme



"""
_____PARTIE 2 :_____

Il semble que l'objectif soit de trouver les deux seuls nombres dans chaque ligne où l'un divise l'autre 
de manière égale, c'est-à-dire où le résultat de l'opération de division est un nombre entier. 
Ils aimeraient que vous trouviez ces nombres sur chaque ligne, que vous les divisiez et que vous additionniez 
le résultat de chaque ligne.

Par exemple, étant donné la feuille de calcul suivante :

5 9 2 8
9 4 7 3
3 8 6 5

Dans la première ligne, les deux seuls nombres qui divisent également sont 8 et 2; le résultat de cette division est 4.
Dans la deuxième ligne, les deux nombres sont 9 et 3; le résultat est 3.
Dans la troisième ligne, le résultat est 2.
Dans cet exemple, la somme des résultats serait 4 + 3 + 2 = 9.
"""

def somme_controle2_v1(feuille_calcul: List[List[int]]) -> int:
	"""
	Calcule la somme des différences entre le maximum et le minimum de chaque ligne
	dans une feuille de calcul.

	Args:
		feuille_calcul (list): Une liste de listes représentant une feuille de calcul.

	Returns:
		int: La somme des différences entre le maximum et le minimum de chaque ligne.
	"""
	somme = 0

	for ligne in feuille_calcul :

		for i in range(len(ligne)) :
			for j in range(len(ligne)) :

				if ligne[i] % ligne[j] == 0 and ligne[i] != ligne[j]:
					somme += ligne[i] // ligne[j]

	return somme


def somme_controle2_v2(feuille_calcul: List[List[int]]) -> int:
	"""
	Calcule la somme des différences entre le maximum et le minimum de chaque ligne
	dans une feuille de calcul.

	Args:
		feuille_calcul (list): Une liste de listes représentant une feuille de calcul.

	Returns:
		int: La somme des différences entre le maximum et le minimum de chaque ligne.
    """
	somme = 0

	for ligne in feuille_calcul :

		for i in range(len(ligne)) :
			for j in range(i+1,len(ligne)) :

				if ligne[i] % ligne[j] == 0:
					somme += ligne[i] // ligne[j]

				elif ligne[j] % ligne[i] == 0:
					somme += ligne[j] // ligne[i]

	return somme


# Solution Geoffrey
def somme_controle2_v3(feuille_calcul: List[List[int]]) -> int:
	"""
	Calcule la somme des différences entre le maximum et le minimum de chaque ligne
	dans une feuille de calcul.

	Args:
		feuille_calcul (list): Une liste de listes représentant une feuille de calcul.

	Returns:
		int: La somme des différences entre le maximum et le minimum de chaque ligne.
    """
	somme = 0

	for ligne in feuille_calcul :

		for elem in ligne:
			diviseur = [x // elem for x in ligne if x != elem and x % elem == 0]
			if diviseur:
				somme += sum(diviseur)

	return somme



def tester_fonction(fonction : Callable[[Any], Any], liste_valeurs : List[Any]) -> List[Any]:
	"""
	Teste une fonction avec une liste de valeurs données.

	Args:
		fonction (function): La fonction à tester.
		liste_valeurs (list): Liste des valeurs à tester.

	Returns:
		list: Liste des résultats de l'exécution de la fonction avec chaque valeur.
	"""
	# Liste pour stocker les résultats
	resultats = []

	# Boucle à travers les valeurs et exécute la fonction pour chaque valeur
	for valeur in liste_valeurs:
		resultat = fonction(valeur)
		resultats.append(resultat)

	return resultats




if __name__ == "__main__":

	info_a_tester = {
	    (((5, 1, 9, 5), (7, 5, 3), (2, 4, 6, 8)),): [
		    somme_controlev1,
			somme_controlev2,
			somme_controlev3,
	    ],

	    (((5, 9, 2, 8), (9, 4, 7, 3), (3, 8, 6, 5)),): [
		    somme_controle2_v1,
			somme_controle2_v2,
			somme_controle2_v3,
	    ]
	}

	# Boucle pour itérer sur les clés et les valeurs du dictionnaire
	# Utilisation de enumerate pour savoir quel partie de l'execice on traite
	for index, (valeur, fonctions) in enumerate(info_a_tester.items()):
		print(f"\n__PARTIE {index+1}__")

		# Pour chaque fonction à tester du dictionnaire
		for fonction in fonctions:

			# Appel de la methode de test prenant en paramètre le nom de la fonction à testé (value) 
			# + les valeurs de référence (key)
			resultats_tests = tester_fonction(fonction, valeur)
			print("Résultats des tests pour la fonction '{}':".format(fonction.__name__), resultats_tests)
