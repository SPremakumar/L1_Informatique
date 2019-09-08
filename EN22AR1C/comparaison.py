import sys 

# Cherche le nombre d'occurences dans une liste
def indices(lst, element):
    result = []
    offset = -1
    while True:
        try:
            offset = lst.index(element, offset+1)
        except ValueError:
            return result
        result.append(offset)

def comparaison(x, y): 
    # Convertit les arguments en listes, pour mieux les manipuler.
    list_a = list(x) 
    list_b = list(y)
    compte_a = list_a.count('1') # Compte le nombre de 1 dans les arguments
    compte_b = list_b.count('1')
                
    # 1e cas : comparaison entre deux nombres représentés en complément à 2, dont un est signé et l'autre non. 
    # Dans ce cas, c'est le nom non signé qui est plus grand.
    if list_a[0] == '1' : 
        print(list_b, 'est plus grand que 1 ', list_a)
    else : 
        pass
    
    # 2e cas : comparaison entre deux nombres représentés en complément à 2, qui peuvent signé (les deux ) ou non (les deux également). 
    # Dans ce cas, on regarde la position des '1'.  
        pos_a = indices(list_a, '1') 
        pos_b = indices(list_b, '1')
        count_a = sum(pos_a) # Additionne tous les occurences de '1' dans la liste_a
        count_b = sum(pos_b) # Additionne tous les occurences de '1' dans la liste_b

        zero_a = indices(list_a, '0')
        zero_b = indices(list_b, '0')
        zero_count_a = sum(zero_a) # Additionne tous les occurences de '0' dans la liste_a
        zero_count_b = sum(zero_b) # Additionne tous les occurences de '0' dans la liste_b
        
        if compte_a == compte_b : # Si le nombre de 1 est égale dans les deux arguments
            if list_a[0] and list_b[0] == '0' : 
                if zero_count_b < zero_count_a : # Dans ce cas, on regarde les occurences de 'O'.
                    print(list_a, 'est plus grand que 5', list_b)
                else :
                    print(list_b, 'est plus grand que 6', list_a)
        elif count_a > count_b : # Si dans la liste_a il y a plus de 1 que dans liste_b
            print(list_a, 'est plus grand que 3', list_b)
        elif count_a == count_b : # 
            print(list_a, 'est égale à', list_b)
        else : #
            print(list_a, 'est plus grand que 4', list_b) 


if len(sys.argv) > 2 : comparaison(sys.argv[1], sys.argv[2])
else : exit ("Argument manquant : Veuillez taper deux nombres binaires en complément à deux")