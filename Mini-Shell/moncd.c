# include <stdio.h>
# include <unistd.h>
# include <stdlib.h>

int main(int ac, char * av[]){
  char * dir;
  char buffer[512]; //
  int t;

  if (ac < 2){
    dir = getenv("HOME");
    if (dir == 0)
      dir = "/tmp";
  } 

  else if (ac > 2){ // si nombre d'arguments + 2
    fprintf(stderr, "usage: %s [dir]\n", av[0]); // Erreur
    return 1;
  } 

  else
    dir = av[1];

  t = chdir(dir);
  if (t < 0){
    perror(dir);
    return 1;
  }
  printf( "Repertoire : %s\n", getcwd(buffer,-1)); //
  return 0;
}