#!/bin/bash
# dec_bin.sh

Binaire() {
    local n bit
    for (( n=$1 ; n>0 ; n >>= 1 ));
    do
    	bit="$(( n&1 ))$bit";
    done
    printf "%s\n" "$bit"
    }

echo "Entrez votre nombre décimale :"   
read x
echo "Le résultat est :"
Binaire $x