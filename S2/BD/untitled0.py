#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 26 09:30:25 2023

@author: aabdi
"""
import numpy as np

M = ( [[2, 3],
      [3, -6]] )
print("ma matrice: ", M, "\n\n")

detM = np.linalg.det(M)
print("mon determinant: ", detM, "\n\n")




valp, vecp = np.linalg.eig(M)
print( "Valeurs propres de M :", valp)
print( "Vecteurs propres associés :")

for i in range(len(valp)):
    print(i, ":", valp[i], vecp[:,i])
    
    
print("")
    
    
"""for i in range(len(valp)):
    print(np.dot(M, vecp[:,i]) - valp[i] * vecp[:,i])
"""
print("")
print("")

"""exo 1"""
                            
A = ( [[2, 3],
      [4, -6]] )

colonne = [row[0] for row in A]
print('première colonne: ', colonne)







prix = 0;
poids = float(input("Le poids de votre lettre: "));
if poids < 10:
    prix = 2;
elif poids < 100:
    prix = 3.50;
else:
    prix = 6;
    
print(f"{prix}$ à payer pour votre lettre");


str = "8231753674683997878179259195565332579493378483264978184143341284379682788518559178822225126625428318115396632681141871952894291898364781898929292614792884883249356728741993224889167928232261325123447569829932951268292953928766755779761837993812528527484487298117739869189415599461746944992651752768158611996715467871381527675219481185217357632445748912726487669881876129192932995282777848496561259839781188719233951619188388532698519298142112853776942545211859134185231768952888462471642851588368445761489225786919778983848113833773768236969923939838755997989537648222217996381757542964844337285428654375499359997792679256881378967852376848812795761118139288152799921176874256377615952758268844139579622754965461884862647423491918913628848748756595463191585555385849335742224855473769411212376446591654846168189278959857681336724221434846946124915271196433144335482787432683848594487648477532498952572515118864475621828118274911298396748213136426357769991314661642612786847135485969889237193822718111269561741563479116832364485724716242176288642371849569664594194674763319687735723517614962575592111286177553435651952853878775431234327919595595658641534765455489561934548474291254387229751472883423413196845162752716925199866591883313638846474321161569892518574346226751366315311145777448781862222126923449311838564685882695889397531413937666673233451216968414288135984394249684886554812761191289485457945866524228415191549168557957633386991931186773843869999284468773866221976873998168818944399661463963658784821796272987155278195355579386768156718813624559264574836134419725187881514665834441359644955768658663278765363789664721736533517774292478192143934318399418188298753351815388561359528533778996296279366394386455544446922653976725113889842749182361253582433319351193862788433113852782596161148992233558144692913791714859516653421917841295749163469751479835492713392861519993791967927773114713888458982796514977717987598165486967786989991998142488631168697963816156374216224386193941566358543266646516247854435356941566492841213424915682394928959116411457967897614457497279472661229548612777155998358618945222326558176486944695689777438164612198225816646583996426313832539918"
strstr = "8231753674683997878179259195565332579493378483264978184143341284379682788518559178822225126625428318115396632681141871952894291898364781898929292614792884883249356728741993224889167928232261325123447569829932951268292953928766755779761837993812528527484487298117739869189415599461746944992651752768158611996715467871381527675219481185217357632445748912726487669881876129192932995282777848496561259839781188719233951619188388532698519298142112853776942545211859134185231768952888462471642851588368445761489225786919778983848113833773768236969923939838755997989537648222217996381757542964844337285428654375499359997792679256881378967852376848812795761118139288152799921176874256377615952758268844139579622754965461884862647423491918913628848748756595463191585555385849335742224855473769411212376446591654846168189278959857681336724221434846946124915271196433144335482787432683848594487648477532498952572515118864475621828118274911298396748213136426357769991314661642612786847135485969889237193822718111269561741563479116832364485724716242176288642371849569664594194674763319687735723517614962575592111286177553435651952853878775431234327919595595658641534765455489561934548474291254387229751472883423413196845162752716925199866591883313638846474321161569892518574346226751366315311145777448781862222126923449311838564685882695889397531413937666673233451216968414288135984394249684886554812761191289485457945866524228415191549168557957633386991931186773843869999284468773866221976873998168818944399661463963658784821796272987155278195355579386768156718813624559264574836134419725187881514665834441359644955768658663278765363789664721736533517774292478192143934318399418188298753351815388561359528533778996296279366394386455544446922653976725113889842749182361253582433319351193862788433113852782596161148992233558144692913791714859516653421917841295749163469751479835492713392861519993791967927773114713888458982796514977717987598165486967786989991998142488631168697963816156374216224386193941566358543266646516247854435356941566492841213424915682394928959116411457967897614457497279472661229548612777155998358618945222326558176486944695689777438164612198225816646583996426313832539918"        
s = """-9
+7
+5
-13
+6
+14
-5
-10
-10
-12
+2
+5
+2
-6
-12
+1
+13
+5
+3
-15
-12
+4
-11
+10
-5
-14
-6
+2
-9
-18
+8
-1
+12
+9
+5
-9
+14
+3
-4
-16
+14
+14
+13
-7
-19
+12
-9
+5
+21
-7
+19
-2
+14
+18
+17
+4
+11
-16
-5
-6
-7
-2
-1
-2
-1
+14
-17
+5
+13
+8
-6
+15
+2
+16
-7
-6
+11
+10
+17
+13
-7
+17
-18
+2
+8
-17
+16
+4
+7
+4
-10
-10
+8
+16
-13
-19
-12
-12
+10
-5
+21
-12
-17
+6
-19
+18
-10
+3
-19
+7
+16
-12
+6
+15
-4
+9
+5
+17
-16
-4
-8
+2
+8
+5
-6
+9
+2
+17
+15
-6
+9
+18
+6
+18
-5
-3
+17
+7
-10
-5
+4
-6
+3
-12
-15
-16
-16
+18
+16
-14
-9
+12
-13
-2
+5
+16
-15
+7
+9
+8
-11
-8
-15
+13
+11
+18
-15
-5
+10
+14
-13
+16
+2
+19
+17
+17
-12
+17
+8
-4
-12
-11
-12
-4
+15
+5
+9
-18
-14
-8
+13
+19
+2
-11
+5
+5
-3
+6
+9
+12
+19
-15
-12
-6
+22
+2
-4
+16
-11
+18
+6
+14
+1
-3
-10
+6
-10
+12
+7
+1
-11
+13
-17
+19
+16
+1
-12
-14
+8
+16
-11
+10
+7
+5
-6
+5
+8
+2
-4
+8
+5
-10
+7
+5
+4
+13
+15
+12
+12
-14
+6
-12
+2
-8
+16
+5
+10
+18
-2
+16
+2
-11
-13
+19
+9
+12
+18
+14
+17
+9
-13
+25
-27
+18
+4
+16
+5
-15
+13
+15
-16
+12
+23
-12
-8
-19
-10
+24
+16
+6
-15
+26
-16
-13
+7
+25
+12
+19
+14
+16
-5
-12
-22
-17
-20
-6
-32
-2
-18
-10
-11
-26
+10
-17
-8
-17
-8
+9
-16
-14
-19
+17
+19
+2
+20
+19
-13
-7
+19
-14
-15
-5
+3
-19
-6
-11
-2
+15
+13
-8
-12
-22
-9
-14
+15
-17
-1
-13
+9
+17
+15
-7
+13
+2
+15
-6
+17
+14
+8
+24
-19
-10
+26
-31
-18
-9
+11
-15
+20
+22
+2
+20
+18
+10
-16
-20
-32
+27
+33
-12
-13
+14
-20
-80
-11
+6
-19
-13
-5
-9
+5
+13
-8
-17
-14
-10
-16
-5
-11
+6
+6
-9
-13
-4
-20
+13
+3
+15
+4
+18
+3
-13
-7
+11
-20
-6
+18
+13
-23
+13
-17
-18
-5
+7
+8
-13
-23
-18
+14
+2
+7
-1
+5
-16
-15
+7
-8
+10
-16
-10
-22
+3
+18
+8
-6
-4
+7
+24
-8
-22
+27
+15
+1
-14
-47
-22
-10
+48
-56
-41
-9
+73
+79
-9
+48
-11
+36
+6
-16
+20
+10
+13
-20
+12
+9
+3
+4
+9
-12
+15
+2
+19
+8
+16
+13
-19
-23
+10
-18
+12
+20
+3
+12
-17
-8
+20
+3
+8
+2
-17
-13
-18
-8
-28
+7
+1
+4
-1
-29
+131
-4
+8
-27
-32
+14
-16
-10
-77
-31
+160
-115
-130
-103
+930
+75389
-16
-5
+4
+8
+2
-7
+6
+7
+11
-8
+4
-3
-5
+13
+7
-5
+7
-5
-1
+11
+18
+19
-18
+7
-14
+2
-5
+12
+11
+15
-17
-6
+17
+3
-4
+9
+16
-13
+2
+19
-7
-3
+18
+20
-11
+13
+3
+4
-2
+14
+9
-17
+2
+8
-5
-8
+2
+10
+17
+2
+15
-1
-11
+13
-9
-5
-19
-18
-16
-14
-7
-13
-11
-10
+15
+7
+18
-12
-9
-16
+3
-14
-1
+16
-9
-12
-19
+1
-5
-15
-14
-7
+17
-1
-19
-9
+6
+12
-21
-20
-11
-6
+8
+5
+10
-2
+12
-13
+6
+12
-10
+13
-6
+19
-3
-22
-18
-4
-3
+20
+10
-3
-19
-9
+6
-7
-13
-18
-18
-3
+10
-13
-14
-6
+9
+20
+5
+5
+16
+14
+14
-19
-19
+11
+10
-14
-17
-19
-6
-11
-13
-1
-18
-14
+10
-8
+1
+1
+15
+8
-15
+6
-9
+2
+12
+13
-7
-5
-19
-6
-1
-19
-12
-1
-4
-6
-16
+2
-20
-15
+5
+9
-19
+12
+9
-15
-5
-12
-6
-12
-11
+13
-11
-9
-2
-16
-17
-9
+16
+20
+5
+20
-7
-6
+4
-12
-1
-5
-22
-19
+10
-9
-4
-5
-8
-11
-18
-13
+20
+1
-12
+7
-19
+10
-8
+13
-7
-19
-15
-2
+7
-18
-14
+2
+15
-6
-20
-10
+20
+3
-19
-19
-22
-14
+7
+10
-15
-12
-18
-7
-20
-12
+1
+14
+13
-8
-1
-10
-13
+9
+11
+7
+18
-4
+6
-3
+20
+18
-14
-3
+11
+15
+8
-9
+28
+15
+13
+14
+4
-13
-1
-14
-5
-20
+16
+10
+11
+32
+23
+18
+3
+3
-12
+4
+11
+14
+17
+2
+6
-5
+19
+12
+17
-15
-10
-15
-5
-17
+20
+20
-14
+23
-14
+26
-11
+9
+21
+4
+16
-4
+5
-11
-8
-10
-5
+14
-2
-4
+12
-10
+16
+1
+12
+1
-2
-17
+10
+21
-9
+15
-9
+14
+3
-1
+5
+19
+10
-7
-10
-13
+14
-2
+16
+10
-1
-20
+9
-8
-9
-19
+18
+3
-18
+11
-1
-5
+21
+22
+4
-11
+6
+18
-8
+10
+12
-19
-5
+25
+5
-12
-12
+3
+14
+15
+4
+6
+19
+18
+7
-16
-1
-13
-6
-1
+11
-7
+13
-15
-5
+13
+21
-3
-14
-8
-16
+13
+2
-9
-18
+21
-20
-20
+18
-19
-22
+20
-3
-4
-9
-8
-20
+1
-21
-4
-9
-1
+18
-7
+10
+20
-16
+23
+17
+9
-19
-3
+9
+5
+2
-25
+1
-15
-55
-13
-10
-11
+1
-14
-12
+23
+15
+15
-2
+19
-7
-6
+10
+12
+1
+8
-51
+28
+24
-98
+16
-3
-5
-13
-37
+6
-14
+9
-12
-6
-23
+16
-12
-10
+3
+41
+4
+20
-13
-5
-1
-64
-30
-11
-23
-46
-27
-11
-75223"""

def maFonction(nombre):
    compteur = 0
    for i in range(len(nombre) - 1):
        if nombre[i] == nombre[i + 1]:
            compteur += int(nombre[i])
    if nombre[len(nombre) - 1] == nombre[0]:
        compteur += int(nombre[0])
            
    return compteur


def maFonctionBis(nombre):
    compteur = 0
    for index, valeur in enumerate(nombre):
        print(f"index: {index} et valeur: {valeur}")
        if index + 1 < len(nombre):
            if nombre[index] == nombre[index + 1]:
                compteur += int(nombre[index])
    if nombre[len(nombre) - 1] == nombre[0]:
        compteur += int(nombre[0])
        
    return print(f"compteur: {compteur}")


def maFonction2(nombre):
    compteur = 0
    demi_taille = int(len(nombre) / 2)
    for index in range(demi_taille):
        if nombre[index] == nombre[index + demi_taille]:
            compteur += int(nombre[index + demi_taille])

    return compteur * 2


def maFonction3(nombre):
    compteur = 0
    nombre = nombre.splitlines()
    for i in range(len(nombre)):
        compteur += int(nombre[i])
    
    return print(f"compteur: {compteur}")



def maFonction4(nombre):
    
    compteur = 0
    nombre = nombre.splitlines()
    listCompteur = [0]
    for i in range(len(nombre)):
        compteur += int(nombre[i])
        listCompteur.append(compteur)
        for j in range(len(listCompteur)):
            if j != len(listCompteur) and compteur == listCompteur[j]:
                return compteur
            
            
    return compteur


"""def generateur_premier(debut: int = 0, fin: int = 100, step: int = 1):
    taille = 0
    x = debut
    while taille < fin:
        i = 2
        while x > i:
            if x % i == 0:
                break
            i += 1
        else:
            taille += 1
            yield(x)
        x += 1
        
gen = generateur_premier()
i = 0
for element in gen:
    i += 1
    print(f"nombre: {element} et i: {i}")"""
    
    
    
def generateur_fibonacci(debut: int = 0, fin: int = 100, step: int = 1):
    taille = 0
    a, b = 0, 1
    while taille < fin:     
        yield(a)
        a, b = b, a + b
        taille += 1
        
gen_deux = generateur_fibonacci()
i = 0
for element in gen_deux:
    print(f"nombre: {element} et i: {i}")
    i += 1
    
"""

a = 0 / b = 1
------0
a = 1 / b = 1
------1
a = 1 / b = 2
------1
a = 2 / b = 3
------2
a = 3 / b = 5
------3

"""


def generateur_tp(premiere_val: int, facteur: int, debut: int = 0, fin: int = 40000000, step: int = 1):
    taille = 0
    valeur = premiere_val
    while taille < fin:
        valeur = (valeur * facteur) % 2147483647
        yield(valeur)
        taille += 1

"""# Récupérer la dernière valeur de chaque générateur
derniere_valeur_a = next(generateur_tp(277, 16807), None)
derniere_valeur_b = next(generateur_tp_deux(349, 48271), None)

# Afficher les dernières valeurs
print(f"Dernière valeur de A: {derniere_valeur_a}")
print(f"Dernière valeur de B: {derniere_valeur_b}")"""
    
    
def comptage(val_a: int = 277, val_b: int = 349, fin: int = 40000000):
    gen_a = generateur_tp(val_a, 16807, fin)
    gen_b = generateur_tp(val_b, 48271, fin)
    
    compteur = 0
    for _ in range(fin):
        if (next(gen_a) & 0xFFFF) == (next(gen_b) & 0xFFFF):
            compteur += 1
            
    return compteur
    


"""nombre_correspondances = comptage(277, 349)
print(f"Nombre total de correspondances : {nombre_correspondances}")"""

    
    
    
puzzle = """104	240	147	246	123	175	372	71	116	230	260	118	202	270	277	292
740	755	135	205	429	822	844	90	828	115	440	805	526	91	519	373
1630	991	1471	1294	52	1566	50	1508	1367	1489	55	547	342	512	323	51
1356	178	1705	119	1609	1409	245	292	1434	694	405	1692	247	193	1482	1407
2235	3321	3647	212	1402	3711	3641	1287	2725	692	1235	3100	123	144	104	101
1306	1224	1238	186	751	734	1204	1275	366	149	1114	166	1118	239	153	943
132	1547	1564	512	2643	2376	2324	2159	1658	107	1604	145	2407	131	2073	1878
1845	91	1662	108	92	1706	1815	1797	1728	1150	1576	83	97	547	1267	261
78	558	419	435	565	107	638	173	93	580	338	52	633	256	377	73
1143	3516	4205	3523	148	401	3996	3588	300	1117	2915	1649	135	134	182	267
156	2760	1816	2442	2985	990	2598	1273	167	821	138	141	2761	2399	1330	1276
3746	3979	2989	161	4554	156	3359	173	3319	192	3707	264	762	2672	4423	2924
3098	4309	4971	5439	131	171	5544	595	154	571	4399	4294	160	6201	4329	5244
728	249	1728	305	2407	239	691	2241	2545	1543	55	2303	1020	753	193	1638
260	352	190	877	118	77	1065	1105	1085	1032	71	87	851	56	1161	667
1763	464	182	1932	1209	640	545	931	1979	197	1774	174	2074	1800	939	161"""    
    
    
    
    
    
def dernier_tp(liste):

    lignes = liste.splitlines()
    resultat = 0
    
    for ligne in lignes:
        
        nombres = [int(n) for n in ligne.split("\t")]
        most = max(nombres)
        less = min(nombres)
        resultat += (most - less)
        
    print(resultat)
    
    
def dernier_tp_bis(liste):

    lignes = liste.splitlines()
    resultat = 0
    a, b = 0, 0
    
    for ligne in lignes:
        
        nombres = [int(n) for n in ligne.split("\t")]
        a = max(nombres)
        b = min(nombres)
        i = 0
        while (a % b != 0):
            print(a) 
            print(b)
            if i % 2 == 0:
                nombres.remove(a)
                a = max(nombres)
            else:
                nombres.remove(b)
                b = min(nombres)
                
            i += 1
        
        resultat += (a / b)
        
    return resultat
        
    
    
a = dernier_tp_bis(puzzle)

print(a)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
