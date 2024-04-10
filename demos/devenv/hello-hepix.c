#include <stdio.h>

#define CONFERENCE_NAME "HEPiX"
#define DATE "2024"

int main(int argc, char **argv) {
    if(argc != 1) {
        printf("%s takes no arguments.\n", argv[0]);
        return 1;
    }

    printf("Hello %s %s!\n", CONFERENCE_NAME, DATE);

    return 0;
}
