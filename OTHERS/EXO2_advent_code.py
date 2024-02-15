"""
@Auteur : Fabien

https://adventofcode.com/2017/day/1

=> Les captchas fourni on été considéré comme des tuples de string.

=> Chacune des fonctionalités seront ordonnées de la moins "pythonesque" à la plus "pythonesque"

_____PARTIE 1 :_____

Le captcha vous oblige à examiner une séquence de chiffres et à trouver la somme de tous les chiffres 
qui correspondent au chiffre suivant de la liste. 
La liste est circulaire, donc le chiffre après le dernier chiffre est le premier chiffre de la liste.

Par exemple:

1122 produit une somme de 3 (1 + 2) car le premier chiffre (1) correspond au deuxième chiffre 
et le troisième chiffre (2) correspond au quatrième chiffre.

1111 produit 4 parce que chaque chiffre (tous 1) correspond au suivant.

1234 produit 0 car aucun chiffre ne correspond au suivant.

91212129 produit 9 car le seul chiffre qui correspond au suivant est le dernier chiffre, 9.

"""

# Importation lié aux hint type des objets :Callable, List et Any
from typing import Callable, List, Any


def sum_matching_digits_v1(digits_list : List[str]) -> int:
	"""
    Calcule la somme des chiffres identiques consécutifs dans une liste de chaînes de caractères.

    Args:
        digits_list (List[str]): Liste de chaînes de caractères représentant les chiffres.

    Returns:
        int: Somme des chiffres identiques consécutifs.
    """
	resultat = 0
	occurence = 0
	element = digits_list[0]
	first_element = digits_list[0]

	for i in range(1, len(digits_list)) :

		if digits_list[i] == element :
			occurence+=1

		else :
			resultat += occurence * int(element)
			occurence = 0
			element = digits_list[i]

	# Comparaison du premier avec le dernier
	if first_element == element:
		occurence+=1

	resultat += occurence * int(element)

	return resultat



def sum_matching_digits_v2(digits_list : List[str]) -> int:
	"""
    Calcule la somme des chiffres identiques consécutifs dans une liste de chaînes de caractères.

    Args:
        digits_list (List[str]): Liste de chaînes de caractères représentant les chiffres.

    Returns:
        int: Somme des chiffres identiques consécutifs.
    """
	total = 0
	list_length = len(digits_list)

	for i in range(list_length):
		current_digit = digits_list[i]

		# Utilisation du modulo pour que la liste soit circulaire
		next_digit = digits_list[(i + 1) % list_length] 

		if current_digit == next_digit:
			total += int(current_digit)
    
	return total


def sum_matching_digits_v3(digits_list : List[str]) -> int:
    """
    Calcule la somme des chiffres identiques consécutifs dans une liste de chaînes de caractères.

    Args:
        digits_list (List[str]): Liste de chaînes de caractères représentant les chiffres.

    Returns:
        int: Somme des chiffres identiques consécutifs.
    """

    # On zip la liste avec elle meme en déplacent le premier élément à la fin (digits_list[1:] + digits_list[0]) 
    # Le but est de parcourir ces 2 liste en même temps pour facilité les comparaisons
    # On retourne tous les digits qui sont égaux au suivant
    # On effectue une somme avec la sortie de la compréhension liste
    total = sum(int(current_digit) for current_digit, next_digit
                in zip(digits_list, digits_list[1:] + digits_list[0]) 
                if current_digit == next_digit)
    return total



"""
_____PARTIE 2 :_____

Désormais, au lieu de considérer le chiffre suivant , il souhaite que vous considériez le chiffre à mi-chemin 
de la liste circulaire. Autrement dit, si votre liste contient 10 des éléments, n'incluez un chiffre dans votre 
somme que si le chiffre 10/2 = 5 avancé correspond à celui-ci. Heureusement, votre liste comporte un nombre pair d’éléments.

Par exemple:

1212 produit 6 : la liste contient 4 des éléments et les quatre chiffres correspondent aux 2 éléments numériques suivants.
1221 produit 0, car chaque comparaison se fait entre a 1 et a 2.
123425 produit 4, car les deux 2 correspondent, mais aucun autre chiffre n'a de correspondance.
123123 produit 12.
12131415 produit 4.

"""

# => La methode sum_matching_digits_v2 et celle-ci pourrait être regroupé en une seule à l'aide d'un paramètre optionel
def sum_matching_digits2_v1(digits_list : List[str]) -> int:
	"""
    Calcule la somme des chiffres correspondants avec un écart de la moitié de la longueur de la liste.
    
    Args:
        digits_list (List[str]): Une liste de chaînes de caractères représentant des chiffres.
        
    Returns:
        int: La somme des chiffres correspondants avec un écart de la moitié de la longueur de la liste.
    """
	total = 0
	list_length = len(digits_list)

	for i in range(list_length):
		current_digit = digits_list[i]

		# Ajout de // 2 au code sum_matching_digits_v2
		next_digit = digits_list[(i + list_length // 2) % (list_length)]

		if current_digit == next_digit:
			total += int(current_digit) 

	return total




def sum_matching_digits2_v2(captcha : List[str]) -> int:
	"""
    Calcule la somme des chiffres correspondants avec un écart de la moitié de la longueur de la liste.
    
    Args:
        digits_list (List[str]): Une liste de chaînes de caractères représentant des chiffres.
        
    Returns:
        int: La somme des chiffres correspondants avec un écart de la moitié de la longueur de la liste.
    """
	resultat = 0
	captcha = str(captcha)
	middle = len(captcha)//2

 	# La liste est circulaire + toujours pair on peut uniquement parcourir la moitié
	for i in range(middle) :
		
		if captcha[i] == captcha[middle+i] :

			# Multiplié par 2 la valeur vu qu'on ne regarde que la moitié de la liste
			resultat += int(captcha[i]) * 2

	return resultat



def sum_matching_digits2_v3(captcha: List[str]) -> int:
    """
    Calcule la somme des chiffres correspondants avec un écart de la moitié de la longueur de la liste.
    
    Args:
        captcha (List[str]): Une liste de chaînes de caractères représentant des chiffres.
        
    Returns:
        int: La somme des chiffres correspondants avec un écart de la moitié de la longueur de la liste.
    """
    resultat = 0
    middle = len(captcha) // 2

    # Utiliser zip pour facilité les comparaisons: 1ere liste du debut au milieu (exclu) 2e du milieu à la fin.
    for digit1, digit2 in zip(captcha[:middle], captcha[middle:]):
        if digit1 == digit2:
            resultat += int(digit1) * 2

    return resultat


# => Méthode sum_matching_digits2_v3 écris sous forme de compréhension list
def sum_matching_digits2_v4(captcha: List[str]) -> int:
    """
    Calcule la somme des chiffres correspondants avec un écart de la moitié de la longueur de la liste.
    
    Args:
        captcha (List[str]): Une liste de chaînes de caractères représentant des chiffres.
        
    Returns:
        int: La somme des chiffres correspondants avec un écart de la moitié de la longueur de la liste.
    """
    middle = len(captcha) // 2
    return sum([int(digit1) * 2 for digit1, digit2 in zip(captcha[:middle], captcha[middle:]) if digit1 == digit2])



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
	    ("1122", "1111", "1234", "91212129"): [
	        sum_matching_digits_v1,
	        sum_matching_digits_v2,
	        sum_matching_digits_v3
	    ],
	    ("1212", "1221", "123425", "123123", "12131415"): [
	        sum_matching_digits2_v1,
	        sum_matching_digits2_v2,
	        sum_matching_digits2_v3,
	        sum_matching_digits2_v4
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
