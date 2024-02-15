"""
@Auteur : Fabien

https://adventofcode.com/2018/day/1

=> Les puzzles fourni on été considéré comme des tuple de int.

=> Chacune des fonctionalités seront ordonnées de la moins "pythonesque" à la plus "pythonesque"

_____PARTIE 1 :_____

Sous le message, l'appareil affiche une séquence de changements de fréquence. 
Une valeur comme +6 signifie que la fréquence actuelle augmente de 6; 
une valeur comme -3 signifie que la fréquence actuelle diminue de 3.

Par exemple, si l'appareil affiche des changements de fréquence de +1, -2, +3, +1, 
alors à partir d'une fréquence de zéro, les changements suivants se produiront :

Fréquence actuelle  0, changement de +1; fréquence résultante  1.
Fréquence actuelle  1, changement de -2; fréquence résultante -1.
Fréquence actuelle -1, changement de +3; fréquence résultante  2.
Fréquence actuelle  2, changement de +1; fréquence résultante  3.
Dans cet exemple, la fréquence résultante est 3.

Voici d’autres exemples de situations :

+1, +1, +1 résulte en 3
+1, +1, -2 résulte en 0
-1, -2, -3 résulte en -6
"""

# Importation lié aux hint type des objets :Callable, List et Any
from typing import Callable, List, Any


def calcul_frequence_v1(liste_frequence: List[int]) -> int:
	"""
	Calcule la somme des fréquences dans une liste donnée.
    
	Args:
		liste_frequence (List[int]): Une liste contenant des éléments numériques (entiers ou flottants).

	Returns:
		int: La somme des fréquences dans la liste.
	"""
	somme = 0

	for element in liste_frequence :
		somme += element

	return somme


# => Ne jamais réinventé la roue 
# => La méthode existe ne la recodez pas utilisez la
def calcul_frequence_v2(liste_frequence: List[int]) -> int:
	"""
    Calcule la somme des fréquences dans une liste donnée.
    
    Args:
        liste_frequence (List[int]): Une liste contenant des éléments numériques (entiers ou flottants).

    Returns:
        int: La somme des fréquences dans la liste.
    """
	return sum(liste_frequence)


"""
_____PARTIE 2 :_____

Vous remarquez que l'appareil répète encore et encore la même liste de changements de fréquence. 
Pour calibrer l'appareil, vous devez trouver la première fréquence qu'il atteint deux fois.

Par exemple, en utilisant la même liste de modifications ci-dessus, le périphérique bouclerait comme suit :

Fréquence actuelle  0, changement de +1; fréquence résultante  1.
Fréquence actuelle  1, changement de -2; fréquence résultante -1.
Fréquence actuelle -1, changement de +3; fréquence résultante  2.
Fréquence actuelle  2, changement de +1; fréquence résultante  3.
(À ce stade, l'appareil continue depuis le début de la liste.)
Fréquence actuelle  3, changement de +1; fréquence résultante  4.
Fréquence actuelle  4, changement de -2; fréquence résultante  2, qui a déjà été vue.
Dans cet exemple, la première fréquence atteinte deux fois est 2. 
Notez que votre appareil devra peut-être répéter sa liste de changements de fréquence plusieurs fois 
avant de trouver une fréquence en double, et que des doublons peuvent être trouvés au cours du traitement de la liste.

Voici d'autres exemples :

+1, -1 atteint d'abord 0 deux fois.
+3, +3, +4, -2, -4 atteint d'abord 10 deux fois.
-6, +3, +8, +5, -6 atteint d'abord 5 deux fois.
+7, +7, -2, -7, -4 atteint d'abord 14 deux fois.

"""


def calcul_frequence2_v1(liste_frequence: List[int]) -> int:
	"""
	Calcule la première fréquence atteinte deux fois en appliquant les changements de fréquence fournis.

	Args:
		liste_frequence (List[int]): Une liste des changements de fréquence.

	Returns:
		int: La première fréquence atteinte deux fois.
	"""
	somme = 0
	somme_freq = [0] # On ajoute la somme de départ à la liste
	valeur_repete = False

	while not valeur_repete :
		i = 0
		while i < len(liste_frequence) and valeur_repete == False :
			somme += liste_frequence[i]
			#print(somme_freq) # TO DEBUG

			if somme in somme_freq :
				valeur_repete = True

			else :
				somme_freq.append(somme)

			i+=1

	return somme


# TODO remplacer while true ?
def generateur(liste_frequence: List[object]) -> object:
	"""
	Génère de manière circulaire les éléments de la liste donnée.

	Args:
	    liste_frequence (list): La liste dont les éléments seront générés de manière circulaire.

	Yields:
	    object: Les éléments de la liste, générés de manière circulaire.
	"""
	index = 0
	taille_liste = len(liste_frequence)

	while True:
		yield liste_frequence[index]
		index = (index + 1) % taille_liste


def calcul_frequence2_v2(liste_frequence: List[int]) -> int:
	"""
	Calcule la première fréquence atteinte deux fois en appliquant les changements de fréquence fournis.

	Args:
		liste_frequence (List[int]): Une liste des changements de fréquence.

	Returns:
		int: La première fréquence atteinte deux fois.
	"""
	somme = 0
	somme_freq = [0] # On ajoute la somme de départ à la liste
	valeur_repete = False
	generator = generateur(liste_frequence) # Utilisation d'un générateur pour remplacer la 2e boucle


	while not valeur_repete:
		
		somme += next(generator)

		if somme in somme_freq :
			valeur_repete = True
		else :
			somme_freq.append(somme)

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


	# Dictionnaire contenant comme clé les nombres de référence (tuple) et comme valeur la liste des fonctions à testé
	# Les clés d'un dico ne peuvent être modifie (uniquement ajouté ou supprimé)
	# Utilisation de tuple comme clé car les tuples son immuable contrairement aux listes
	info_a_tester = {
	    ((1, 1, 1), (1, 1, -2), (-1, -2, -3)): [
	        calcul_frequence_v1,
	        calcul_frequence_v2
	    ],
	    ((+1, -1), (+3, +3, +4, -2, -4), (-6, +3, +8, +5, -6), (+7, +7, -2, -7, -4)): [
	        calcul_frequence2_v1,
	        calcul_frequence2_v2,
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
