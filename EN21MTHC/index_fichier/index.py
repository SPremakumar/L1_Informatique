#! /usr/bin/env python3
# -*- coding: utf-8 -*-

# PREMAKUMAR Samya
# numéro étudiant : 15600051

import sys

stoplist = "le la les du de des tout tous toutes toute un dedans or donc une par pour ce ça cela qui que quelle dans à ai a au sur se eu mais en ou on an a for in as the this that there when which where with from also it you they on if not all to s of his her or".split()
# On y met les mots les plus inutiles, comme les articles, pronoms, ...etc.

def pilote(fichier, idx):
    with open(fichier, 'r', encoding='utf8') as fp:
        for i, ligne in enumerate(fp):
        	i += 1
        	indexe(idx, ligne.split(), i)
        presente(idx)

def ajoute(idx, mot, ligne):
    if mot not in idx:
        idx[mot] = []
    if ligne not in idx[mot]:
        idx[mot].append(ligne)

def indexe(idx, mots, ligne):
    for mot in mots:
        mot = mot.lower()
        mot = nettoie(mot)
        if mot and mot not in stoplist:
            ajoute(idx, mot, ligne)

def nettoie(mot) :
	ponctuation = """(,.;:-/"'?!)"""
	try : 
		if mot[-1] in ponctuation : mot = mot[:-1]
		if mot[0] in ponctuation : mot = mot[1:]
		return mot
	except Exception : 
		pass

def presente(d) :
    for k in sorted(d) :
            valeur = d[k]
            prev_nb = min(valeur)
            pagelist = list()
            for nb in sorted(valeur) :
                    if nb != prev_nb+1 :
                            pagelist.append([nb])
                    elif len(pagelist[-1]) > 1:
                            pagelist[-1][-1] = nb
                    else :
                            pagelist[-1].append(nb)
                    prev_nb = nb
            else :
                    c =','.join (['-'.join(map(str,page)) for page in pagelist])
                    print("\t", k, ':', c)

index = {}

if len(sys.argv) > 1 :
	for x in sys.argv[1:]: pilote(x, index)
else : exit('argument manquant : fichier ')