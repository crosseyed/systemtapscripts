#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include <netdb.h>
#include <unistd.h>
#include <sys/socket.h>

#include <netinet/in.h>
#include <arpa/inet.h>

int main(int argc, char **argv) {
        struct hostent *tmp = 0;
        int i = 0;

        if (argc < 2) {
                printf("Usage: %s <hostname>\n", argv[0]);
                exit(EXIT_FAILURE);
        }

        tmp = gethostbyname(argv[1]);

        if (!tmp) {
                printf("Lookup Failed: %s\n", hstrerror(h_errno));
                return 0;
        }

        printf("%s: %s\n", tmp->h_name, inet_ntoa((struct in_addr) *((struct in_addr *) tmp->h_addr_list[0])) );

        return 0;
}
