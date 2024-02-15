"""
@Auteur : Fabien

https://adventofcode.com/2020/day/1

=> Les puzzle fourni on été considéré comme des tuples de int.

=> Chacune des fonctionalités seront ordonnées de la moins "pythonesque" à la plus "pythonesque"


_____PARTIE 1 :_____


Ils ont besoin que vous trouviez les deux entrées dont la somme correspond à 2020, 
puis que vous multipliiez ces deux nombres ensemble.

Par exemple, supposons que votre note de frais contienne les éléments suivants :

1721
979
366
299
675
1456
Dans cette liste, les deux entrées dont la somme est 2020 sont 1721 et 299. 
Les multiplier ensemble produit 1721 * 299 = 514579, donc la bonne réponse est 514579.

"""

# Importation lié aux hint type des objets :Callable, List et Any
from typing import Callable, List, Any


# => Version non opti car utilisant des for + pas de return ou break dans les boucles
def note_frais_v1(liste_prix : List[int], total: int = 2020) -> int:
	"""
    Recherche deux prix dont la somme est égale au total donné et retourne leur produit.
    
    Args:
        liste_prix (list[int]): Une liste des prix.
        total (int): La somme cible à atteindre (par défaut 2020).
        
    Returns:
        int: Le produit des deux prix trouvés dont la somme est égale au total, ou 0 si aucun résultat n'est trouvé.
    """
	result = None

	for prix in liste_prix :

		somme = 0
		for element in liste_prix[1:] :
			somme = prix + element

			if somme == total :
				result = prix * element

	return result



# => Version + Opti
def note_frais_v2(liste_prix : List[int], total: int = 2020) -> int:
	"""
    Recherche deux prix dont la somme est égale au total donné et retourne leur produit.
    
    Args:
        liste_prix (list[int]): Une liste des prix.
        total (int): La somme cible à atteindre (par défaut 2020).
        
    Returns:
        int: Le produit des deux prix trouvés dont la somme est égale au total, ou 0 si aucun résultat n'est trouvé.
    """
	result = None
	i = 0
	j = 1

	while i < len(liste_prix) and result is None :

		somme = 0
		while j < len(liste_prix) and result is None :
			somme = liste_prix[i] + liste_prix[j]

			if somme == total :
				result = liste_prix[i] * liste_prix[j]

			j += 1

		i += 1

	return result


# => Version + Opti
# => Peut être réalisé avec une boucle for + un return dans la boucle
def note_frais_v3(liste_prix : List[int], total: int = 2020) -> int:
	"""
    Recherche deux prix dont la somme est égale au total donné et retourne leur produit.
    
    Args:
        liste_prix (list[int]): Une liste des prix.
        total (int): La somme cible à atteindre (par défaut 2020).
        
    Returns:
        int: Le produit des deux prix trouvés dont la somme est égale au total, ou 0 si aucun résultat n'est trouvé.
    """
	result = None
	i = 0

	while i < len(liste_prix) and result == None :

		valeur_cherche = total - liste_prix[i]

		if valeur_cherche in liste_prix :
			result = valeur_cherche * liste_prix[i]

		i+=1

	return result

# => Version + Pythonesque mais moins opti que le while
def note_frais_v4(liste_prix: List[int], total: int = 2020) -> int:
    """
    Recherche deux prix dont la somme est égale au total donné et retourne leur produit.
    
    Args:
        liste_prix (List[int]): Une liste des prix.
        total (int): La somme cible à atteindre (par défaut 2020).
        
    Returns:
        int: Le produit des deux prix trouvés dont la somme est égale au total, ou 0 si aucun résultat n'est trouvé.
    """
    result = 0

    for i, prix in enumerate(liste_prix):
        for autre_prix in liste_prix[i + 1:]:
            somme = prix + autre_prix
            if somme == total:
                result = prix * autre_prix 

    return result


# => Version 3 écrite sous forme de liste de comprehension
def note_frais_v5(liste_prix : List[int], total: int = 2020) -> int:
	"""
    Recherche deux prix dont la somme est égale au total donné et retourne leur produit.
    
    Args:
        liste_prix (list[int]): Une liste des prix.
        total (int): La somme cible à atteindre (par défaut 2020).
        
    Returns:
        int: Le produit des deux prix trouvés dont la somme est égale au total, ou 0 si aucun résultat n'est trouvé.
    """
    # On ne recupère que le premier élément car on a 2 match avec le même resultat.
    # Total - val1 = val2 et total - val2 = val1
	return [element * (total - element) for element in liste_prix if total - element in liste_prix][0]


	
"""
_____PARTIE 2 :_____

Trouvez dans votre note de frais trois numéros répondant aux mêmes critères.

"""


# => Le return doit être deplacer dans la boucle pour plus d'opti
# => Amélioration de la methode note_frais_v1
def note_frais2_v1(liste_prix : List[int], total: int = 2020) -> int:
	"""
    Recherche trois prix dont la somme est égale au total donné et retourne leur produit.

    Args:
        liste_prix (list[int]): Une liste des prix.
        total (int): La somme cible à atteindre (par défaut 2020).

    Returns:
        int: Le produit des trois prix trouvés dont la somme est égale au total, ou 0 si aucun résultat n'est trouvé.
    """
	result = 0

	for prix1 in liste_prix :
		for prix2 in liste_prix[1:]:

			for prix3 in liste_prix[2:] :

				if prix1 + prix2 + prix3 == total :
					result = prix1 * prix2 * prix3
	return result


# => Le return doit être deplacer dans la boucle pour plus d'opti
# => Possible d'améliorer avec une comprehension liste à 3 boucles pour calculer toutes les combinaisons
# => Amélioration de la methode note_frais_v2
def note_frais2_v2(liste_prix : List[int], total: int = 2020) -> int:
	"""
    Recherche trois prix dont la somme est égale au total donné et retourne leur produit.

    Args:
        liste_prix (list[int]): Une liste des prix.
        total (int): La somme cible à atteindre (par défaut 2020).

    Returns:
        int: Le produit des trois prix trouvés dont la somme est égale au total, ou 0 si aucun résultat n'est trouvé.
    """
	result = None
	i = 0
	
	while i < len(liste_prix) and result == None :
		j = i + 1

		while j < len(liste_prix) and result == None :
			k = j + 1

			while k < len(liste_prix) and result == None :

				if liste_prix[i] + liste_prix[j] + liste_prix[k] == total :
					result = liste_prix[i] * liste_prix[j] * liste_prix[k]

				k+=1
			j+=1
		i+=1

	return result



# => Le return doit être deplacer dans la boucle pour plus d'opti
# => Possible d'améliorer avec une comprehension liste à 3 boucles pour calculer toutes les combinaisons
# => Amélioration de la methode note_frais_v3
def note_frais2_v3(liste_prix : List[int], total: int = 2020) -> int:
	"""
    Recherche trois prix dont la somme est égale au total donné et retourne leur produit.

    Args:
        liste_prix (list[int]): Une liste des prix.
        total (int): La somme cible à atteindre (par défaut 2020).

    Returns:
        int: Le produit des trois prix trouvés dont la somme est égale au total, ou 0 si aucun résultat n'est trouvé.
    """
	result = None
	i = 0
	
	while i < len(liste_prix) and result == None :
		j = i + 1

		while j < len(liste_prix) and result == None :

			# Remplace la 3e boucle
			somme = total - liste_prix[i] - liste_prix[j]

			if somme in liste_prix :
				result = liste_prix[i] * liste_prix[j] * somme

			j+=1
		i+=1

	return result


# => Le return doit être deplacer dans la boucle pour plus d'opti
# => Possible d'améliorer avec une comprehension liste à 3 boucles pour calculer toutes les combinaisons
# => Amélioration de la methode note_frais_v4
def note_frais2_v4(liste_prix : List[int], total: int = 2020) -> int:
	"""
	Recherche trois prix dont la somme est égale au total donné et retourne leur produit.

	Args:
		liste_prix (list[int]): Une liste des prix.
		total (int): La somme cible à atteindre (par défaut 2020).

	Returns:
		int: Le produit des trois prix trouvés dont la somme est égale au total, ou 0 si aucun résultat n'est trouvé.
    """
	for i, prix1 in enumerate(liste_prix):
		for j, prix2 in enumerate(liste_prix[i+1:], start=i+1): # On precise start pour l'index (j)
			for prix3 in liste_prix[j+1:]:
				if prix1 + prix2 + prix3 == total:
					result = prix1 * prix2 * prix3
	return result




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
		((1721, 979, 366, 299, 675, 1456),) : [
		[note_frais_v1,
		note_frais_v2,
		note_frais_v3,
		note_frais_v4,
		note_frais_v5],

		[note_frais2_v1,
		note_frais2_v2,
		note_frais2_v3,
		note_frais2_v4,]
		],
	}

	# Boucle pour itérer sur les clés et les valeurs du dictionnaire
	# Utilisation de enumerate pour savoir quel partie de l'execice on traite
	for index, (valeur, fonctions) in enumerate(info_a_tester.items()):
		

		# Pour chaque fonction à tester du dictionnaire
		for indice_partie, ensemble_fonction in enumerate(fonctions) :
			print(f"\n__PARTIE {indice_partie+1}__")

			for fonction in ensemble_fonction:

				# Appel de la methode de test prenant en paramètre le nom de la fonction à testé (value) 
				# + les valeurs de référence (key)
				resultats_tests = tester_fonction(fonction, valeur)
				print("Résultats des tests pour la fonction '{}':".format(fonction.__name__), resultats_tests)
