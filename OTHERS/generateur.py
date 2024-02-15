"""
@Auteur : Fabien

Développez un générateur qui produira des nombres premiers 
en utilisant comme paramètres un début, une fin et un pas.

Comme pour range la borne de fin sera exclu.

Exemple :
Pour les valeurs debut = 1, fin = 5 et pas = 1 ont aura les valeur suivante : 2, 3, 5, 7
Pour les valeurs debut = 3, fin = 5 et pas = 1 ont aura les valeur suivante : 5, 7
Pour les valeurs debut = 1, fin = 5 et pas = 2 ont aura les valeur suivante : 2, 5


"""

# Importation de la bibliothèque possedant les calculs mathématiques
import math

# Importation lié au hint type Generator
from typing import Generator


def generateur_nombre_premier_v1(debut: int, fin: int, pas: int = 1) -> Generator[int, None, None]:
    """
    Génère les nombres premiers dans une plage donnée.

    Args:
        debut (int): Le début de la plage.
        fin (int): La fin de la plage.
        pas (int, optionnel): L'incrément. Par défaut, 1.

    Yields:
        Generator[int, None, None]: Les nombres premiers dans la plage spécifiée.
    """
    compteur = 0
    nombre = 2
    list_diviseurs = []

    while compteur < fin - 1:

        # Mathématique on n'a pas besoin de tester jusqu'au nombre mais plutôt sa racine
        # On n'oublie pas le +1 car la limite est exclue
        for diviseur in range(2, int(math.sqrt(nombre)) + 1): 
            if nombre % diviseur == 0:
                list_diviseurs.append(diviseur)

        # Par défaut, une liste vide est évaluée comme False
        if not list_diviseurs:

            if compteur >= debut - 1 and compteur % pas == 0:
                yield nombre

            compteur += 1

        nombre += 1
        list_diviseurs = []


# => Version plus opti si un diviseur est trouvé le nombre n'est pas premier on passe au suivant
def generateur_nombre_premier_v2(debut: int, fin: int, pas: int = 1) -> Generator[int, None, None]:
    """
    Génère les nombres premiers dans un intervalle donné.

    Args:
        debut (int): Le début de l'intervalle.
        fin (int): La fin de l'intervalle.
        pas (int): Le pas pour itérer sur les nombres (par défaut 1).

    Yields:
        Generator[int, None, None]: Un générateur produisant les nombres premiers dans l'intervalle donné.
    """
    compteur = 0
    nombre = 2
    list_diviseurs = []

    while compteur < fin - 1:

        diviseur = 2

        # On teste jusqu'à la racine carrée du nombre pour l'optimalité
        while not list_diviseurs and diviseur < int(math.sqrt(nombre)) + 1: 
            if nombre % diviseur == 0:
                list_diviseurs.append(diviseur)

            diviseur += 1

        # Si la liste des diviseurs est vide, le nombre est premier
        if not list_diviseurs:

            if compteur >= debut - 1 and compteur % pas == 0:
                yield nombre
                
            compteur += 1

        nombre += 1
        list_diviseurs = []



"""
Développez un générateur calculant la suite de Fibonacci en
utilisant les mêmes paramètres que le précédent

Comme pour range la borne de fin sera exclu.

Exemple :
Pour les valeurs debut = 1, fin = 10 et pas = 1 ont aura les valeur suivante : 0, 1, 1, 2, 3, 5, 8, 13, 21
Pour les valeurs debut = 5, fin = 10 et pas = 1 ont aura les valeur suivante : 3, 5, 8, 13, 21 
Pour les valeurs debut = 1, fin = 10 et pas = 2 ont aura les valeur suivante : 0, 1, 3, 8, 21

"""
		
def generateur_fibonacci_v1(debut: int, fin: int, pas: int = 1) -> Generator[int, None, None]:
    """
    Génère la séquence de Fibonacci dans un intervalle donné.

    Args:
        debut (int): Le début de l'intervalle.
        fin (int): La fin de l'intervalle.
        pas (int): Le pas pour itérer sur les nombres (par défaut 1).

    Yields:
        Generator[int, None, None]: Un générateur produisant la séquence de Fibonacci dans l'intervalle donné.
    """
    compteur = 0
    ancien_nombre = 0
    nombre_actuel = 1

    while compteur < fin - 1:

        if compteur >= debut - 1 and compteur % pas == 0:
            yield ancien_nombre
                
        compteur += 1
        nombre_suivant = ancien_nombre + nombre_actuel
        ancien_nombre = nombre_actuel
        nombre_actuel = nombre_suivant
        

# => On connait la fin une boucle for est donc plus adapté
def generateur_fibonacci_v2(debut: int, fin: int, pas: int = 1) -> Generator[int, None, None]:
    """
    Génère la séquence de Fibonacci dans un intervalle donné.

    Args:
        debut (int): Le début de l'intervalle.
        fin (int): La fin de l'intervalle.
        pas (int): Le pas pour itérer sur les nombres (par défaut 1).

    Yields:
        Generator[int, None, None]: Un générateur produisant la séquence de Fibonacci dans l'intervalle donné.
    """
    ancien_nombre, nombre_actuel = 0, 1

    for compteur in range(fin - 1):
        if compteur >= debut - 1 and compteur % pas == 0:
            yield ancien_nombre

        ancien_nombre, nombre_actuel = nombre_actuel, ancien_nombre + nombre_actuel




def test_generateur(generateur, debut, fin, pas=1):
    """
    Teste un générateur avec les paramètres donnés et imprime les résultats.

    Args:
        generateur (Generator): Le générateur à tester.
        debut (int): Le début de l'intervalle.
        fin (int): La fin de l'intervalle.
        pas (int): Le pas pour itérer sur les nombres (par défaut 1).
    """
    print(f"\n {generateur.__name__} avec début={debut}, fin={fin}, pas={pas}:")
    # Forcer l'évaluation immédiate du générateur en utilisant une liste en compréhension
    resultats = [nombre for nombre in generateur(debut, fin, pas)]
    for nombre in resultats:
        print(nombre)


if __name__ == "__main__":
	test = {
		((1, 5, 1), (3, 5, 1), (1, 5, 2)): [
			generateur_nombre_premier_v1,
			generateur_nombre_premier_v2
		],

		((1, 10, 1), (5, 10, 1), (1, 10, 2)): [
			generateur_fibonacci_v1,
			generateur_fibonacci_v2
		],
	}

	for parametres, fonctions in test.items():
		for fonction in fonctions:
			for debut, fin, pas in parametres:
				# Construire le générateur avec les paramètres spécifiés
				gen = fonction(debut, fin, pas)

				print(f"\nAppel de {fonction.__name__} avec début={debut}, fin={fin}, pas={pas}:")

				# Afficher les valeurs générées par le générateur
				for valeur in gen:
					print(valeur)


