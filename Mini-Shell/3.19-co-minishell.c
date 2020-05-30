# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>
# include <sys/types.h>
# include <sys/wait.h>
# include <assert.h>
# include <string.h>

enum {
	MaxLigne = 1024,              // longueur max d'une ligne de commandes
	MaxMot = MaxLigne / 2,        // nbre max de mot dans la ligne
	MaxDirs = 100,                // nbre max de repertoire dans PATH
	MaxPathLength = 512,          // longueur max d'un nom de fichier
};

void decouper(char *, char *, char **, int);

# define PROMPT "? "

int main(int argc, char * argv[]){
	char ligne[MaxLigne];
    char pathname[MaxPathLength];
    char * mot[MaxMot];
    char * dirs[MaxDirs];
    int i, tmp, background;
    char * dir; // Pour la commande "cd"
    char buffer[512]; // Pour la commande "cd"
    int t; // Pour la commande "cd"

    decouper(getenv("PATH"), ":", dirs, MaxDirs);

    for(printf(PROMPT); fgets(ligne, sizeof ligne, stdin) != 0; printf(PROMPT)){
    	decouper(ligne, " \t\n", mot, MaxMot);
    	for(i = 0; mot[i] != 0 ; i++);
    		if (mot[0] == 0) // ligne vide 
    			continue;

            // La commande cd
            if (strcmp(mot[0], "cd") == 0){
                if (mot[1] == 0) 
                    mot[1] = getenv("HOME");
                else if (mot[2] != 0){
                    fprintf(stderr, "usage: cd [dir]\n");
                    continue;
                }
                if (chdir(mot[1]) < 0)
                    perror("cd");
                printf( "Repertoire : %s\n", getcwd(buffer,-1)); // Pour la commande "cd"
                continue;
            }
 		
 		// lancement du processus enfant 
    	tmp = fork();

        // enfant : 
    	if (tmp < 0){
    		perror("fork");
            continue;
            }

        // parent :
        if (tmp != 0){
        	if (background = 0){
        		while(wait(0) != tmp);
        	}
        	continue;
        }

        // Les processus en arrière plan :
        if(strcmp(mot[i-1], "&") == 0){
        	mot[i-1] = NULL;
        	background = 1;
        }

        //Execution de la commande : 
        for(i = 0; dirs[i] != 0; i++){
        	snprintf(pathname, sizeof pathname, "%s/%s", dirs[i], mot[0]);
            execvp(pathname, mot);
        }

        // En cas d'erreur : aucun exec() n'a fonctionne
        fprintf(stderr, "%s: not found\n", mot[0]);
        exit(1);
    }

    printf("Bye\n");
    return 0;
}


void decouper(char * ligne, char * separ, char * mot[], int maxmot){
	int i;
	mot[0] = strtok(ligne, separ);
	for(i = 1; mot[i - 1] != 0; i++){
	 if (i == maxmot){
	 	fprintf(stderr, "Erreur dans la fonction decouper: trop de mots\n");
	 	mot[i - 1] = 0;
	 }
	 mot[i] = strtok(NULL, separ);
	}
}