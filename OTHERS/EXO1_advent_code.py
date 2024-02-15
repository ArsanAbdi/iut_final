"""
@Auteur Fabien

https://adventofcode.com/2017/day/15


__PART 1__

Les générateurs fonctionnent tous deux sur le même principe. Pour créer sa prochaine valeur, 
un générateur prendra la valeur précédente qu'il a produite, la multipliera par un facteur 
(le générateur A utilise 16807; le générateur B utilise 48271), puis conservera le reste de la 
division de ce produit résultant par 2147483647. Ce reste final est la valeur qu’il produit ensuite.

Pour calculer la première valeur de chaque générateur, il utilise à la place une valeur de départ 
spécifique comme « valeur précédente » (telle qu'indiquée dans votre entrée de puzzle).

Par exemple, supposons que pour les valeurs de départ, le générateur A utilise 65, tandis que le 
générateur B utilise 8921. Ensuite, les cinq premières paires de valeurs générées sont :

--Gen. A--  --Gen. B--
   1092455   430625591
1181022009  1233683848
 245556042  1431495498
1744312007   137874439
1352636452   285222916
En binaire, ces paires sont (avec la valeur du générateur A en premier dans chaque paire) :

00000000000100001010101101100111
00011001101010101101001100110111

01000110011001001111011100111001
01001001100010001000010110001000

00001110101000101110001101001010
01010101010100101110001101001010

01100111111110000001011011000111
00001000001101111100110000000111

01010000100111111001100000100100
00010001000000000010100000000100
Ici, vous pouvez voir que les 16 bits les plus bas (ici, les plus à droite) de la troisième valeur correspondent : 
1110001101001010. En raison de ce seul match, après avoir traité ces cinq paires, le juge n'aurait ajouté qu'à 1son total.


__PART 2__

Ils génèrent toujours des valeurs de la même manière, mais désormais ils ne remettent une valeur au juge que lorsqu'elle
répond à leurs critères :

Le générateur A recherche des valeurs multiples de 4.
Le générateur B recherche des valeurs multiples de 8.


En utilisant les exemples de valeurs de départ donnés ci-dessus, les générateurs produisent maintenant chacun les 
cinq premières valeurs suivantes :

--Gen. A--  --Gen. B--
1352636452  1233683848
1992081072   862516352
530830436  1159784568
1980017072  1616057672
740335192   412269392

Ces valeurs ont les valeurs binaires correspondantes suivantes :

01010000100111111001100000100100
01001001100010001000010110001000

01110110101111001011111010110000
00110011011010001111010010000000

00011111101000111101010001100100
01000101001000001110100001111000

01110110000001001010100110110000
01100000010100110001010101001000

00101100001000001001111001011000
00011000100100101011101101010000

Malheureusement, même si ce changement rend plus de bits similaires en moyenne, aucun des 16 bits les plus bas 
de ces valeurs ne correspond. Désormais, ce n'est qu'à la 1056 ème paire que le juge trouve la première correspondance :

--Gen. A--  --Gen. B--
1023762912   896885216

00111101000001010110000111100000
00110101011101010110000111100000

Ce changement rend les générateurs beaucoup plus lents et le juge s'impatiente ; elle n'est désormais disposée 
à considérer que 5 millions de paires. (En utilisant les valeurs de l'exemple ci-dessus, après cinq millions de paires, 
le juge finirait par trouver un total de 309paires qui correspondent dans leurs 16 bits les plus bas.)

"""

# Importation lié au hint type Generator
from typing import Generator, List

def clef_generateur(quantite: int, valeur_depart: int, facteur: int, diviseur: int = 2147483647, multiple = 1) -> Generator[int, None, None]:
	"""
	Génère une séquence de clés à partir d'une valeur de départ, d'un facteur multiplicatif et d'un diviseur.

	Args:
		quantite (int): Le nombre de clés à générer.
		valeur_depart (int): La valeur de départ pour la génération des clés.
		facteur (int): Le facteur multiplicatif pour générer les clés.
		diviseur (int): Le diviseur pour générer les clés.

	Yields:
		Generator[int, None, None]: Un générateur produisant la séquence de clés générées.
	"""
	valeur_actuel = valeur_depart
	compteur = 0

	while compteur < quantite:
		valeur_actuel = valeur_actuel * facteur % diviseur

		if valeur_actuel % multiple == 0:
			compteur += 1
			yield valeur_actuel



def compare_2_generator_LSB(generator1: Generator[int, None, None], 
									generator2: Generator[int, None, None], 
									nb_bit_compare: int = 16, 
									show: bool = False) -> int:
	"""
	Compare les bits de poids faible de deux générateurs et retourne le nombre de correspondances.

	Args:
		generator1 (Generator[int, None, None]): Le premier générateur à comparer.
		generator2 (Generator[int, None, None]): Le deuxième générateur à comparer.
		nb_bit_compare (int): Le nombre de bits à comparer à partir de la fin. Par défaut, 16.
		show (bool): Indique si les valeurs des générateurs doivent être affichées. Par défaut, False.

	Returns:
		int: Le nombre de correspondances trouvées entre les bits de poids faible des deux générateurs.
	"""
	compteur = 0

	for element1, element2 in zip(generator1, generator2):

		if show:
			print(element1, "\t", element2)  # Pour le débogage

		if bin(element1)[-nb_bit_compare:] == bin(element2)[-nb_bit_compare:]:
			compteur += 1

	return compteur




def appliquer_comparaison(quantite: int, 
								multiples: List[List[int]], 
								start_val: List[int] = [65, 8921], 
								multiplicateurs: List[int] = [16807, 48271], 
								show: bool = False) -> int:
	"""
	Compare les bits de poids faible de deux générateurs et retourne le nombre de correspondances.

	Args:
		quantite (int): La quantité de nombres générés par chaque générateur.
		multiples (List[List[int]]): Les coefficients multiplicateurs pour chaque générateur.
		start_val (List[int]): Les valeurs de départ de chaque générateur. Par défaut, [65, 8921].
		multiplicateurs (List[int]): Les multiplicateurs de chaque générateur. Par défaut, [16807, 48271].
		show (bool): Indique si les valeurs des générateurs doivent être affichées. Par défaut, False.

	Returns:
		int: Le nombre de correspondances trouvées entre les bits de poids faible des deux générateurs.
	"""
	assert (len(start_val) == len(multiplicateurs),
		"ERREUR : Le nombre de valeurs de départ ne correspond pas "
		"au nombre de générateur !")
	generateurs = []

	for start, coef, multiple in zip(start_val, multiplicateurs, multiples):
		generateurs.append(clef_generateur(quantite, start, coef, multiple=multiple))

	return compare_2_generator_LSB(generateurs[0], generateurs[1], show=show)





if __name__ == "__main__":

	quantites = [5, 5]  # Avoir 2 valeurs permet facilement de configurer nos propres valeurs
	multiplicateurs = [[1, 1], [4, 8]]

	for indice, (quantite, multiple) in enumerate(zip(quantites, multiplicateurs)):
		print(f"\n__PART {indice + 1}__")
		match = appliquer_comparaison(quantite, multiple, show=True)
		print("Nombre de valeurs commune trouvées", match)

	
