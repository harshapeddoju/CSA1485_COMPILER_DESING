#include <stdio.h>
#include <string.h>

void leftFactor(char *rule) {
    char nonTerminal, newNonTerminal;
    char production[100], commonPrefix[50] = "";
    int prefixLen = 0;

    sscanf(rule, "%c->%s", &nonTerminal, production);
    newNonTerminal = nonTerminal + 1; // Create a new non-terminal (ensure uniqueness in practice)

    // Find the common prefix
    for (int i = 0; production[i] && production[i] != '|'; i++) {
        int match = 1;
        for (int j = i; production[j] && production[j] != '|'; j++) {
            if (production[j] != production[i + j - i]) {
                match = 0;
                break;
            }
        }
        if (match) {
            commonPrefix[prefixLen++] = production[i];
        } else {
            break;
        }
    }
    commonPrefix[prefixLen] = '\0';

    printf("%c -> %s%c\n", nonTerminal, commonPrefix, newNonTerminal);
    printf("%c ->", newNonTerminal);

    // Print new productions
    char *token = strtok(production, "|");
    while (token != NULL) {
        if (strncmp(token, commonPrefix, prefixLen) == 0) {
            printf(" %s|", token + prefixLen);
        }
        token = strtok(NULL, "|");
    }
    printf(" ε\n");
}

int main() {
    char rule[100];

    printf("Enter a grammar rule (e.g., A->abc|abx|ay): ");
    scanf("%[^\n]s", rule);

    leftFactor(rule);

    return 0;
}
