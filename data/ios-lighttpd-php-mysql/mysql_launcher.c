#include <stdio.h>
#include <stdlib.h>
int main(int argc, char **argv) {
  if(!strcmp(argv, "start", 5) || !strncmp(argv, "stop", 4))
    return 1;
  if(!fork()) {
     setsid();
     execvp("/usr/local/share/mysql/mysql.server", argv);
  }
  return 0;
}
