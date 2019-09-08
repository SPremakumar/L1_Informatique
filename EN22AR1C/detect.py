#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import chardet
import sys

# Interaction avec l'utilisateur :
filename = input('Entrez votre fichier : ')
nom_fichier = input('Entrez un nouveau nom : ')
coding2 = input('Votre nouveau codage : ')

# Détection du codage du fichier :
def detect(filename_detect) : 
    fichier = open(filename_detect, 'rb').read()
    result = chardet.detect(fichier)
    charenc = result['encoding']
    return charenc

# Conversion du fichier :
def file(filename, coding2) : 
    # Pour obtenir le codage :
    codage = detect(filename)
    print("Votre fichier est encodé en : ", codage)
    # Ouvre le fichier en mode lecture :
    f= open(filename, 'r', encoding=codage, errors="ignore")
    content = f.read()
    f.close()
    # Ecrit avec le codage choisi le fichier :
    f= open(nom_fichier, 'w', encoding=coding2, errors="ignore")
    f.write(content)
    f.close()
    print('Conversion fini')

if __name__ == '__main__':
	file(filename, coding2)