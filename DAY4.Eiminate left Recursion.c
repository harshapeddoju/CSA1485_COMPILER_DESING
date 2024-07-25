#include <stdio.h>
#include <string.h>

int main() {
    char nonTerminal;
    char production[100];
    char alpha[50] = "", beta[50] = "";
    int alphaIndex = 0, betaIndex = 0;

    printf("Enter a grammar rule (e.g., A->Aa|b): ");
    scanf("%c->%s", &nonTerminal, production);

    char *token = strtok(production, "|");
    while (token != NULL) {
        if (token[0] == nonTerminal) {
            strcpy(alpha + alphaIndex, token + 1);
            alphaIndex += strlen(token) - 1;
            strcpy(alpha + alphaIndex, "|");
            alphaIndex++;
        } else {
            strcpy(beta + betaIndex, token);
            betaIndex += strlen(token);
            strcpy(beta + betaIndex, "|");
            betaIndex++;
        }
        token = strtok(NULL, "|");
    }
    if (alphaIndex > 0) alpha[alphaIndex - 1] = '\0';
    if (betaIndex > 0) beta[betaIndex - 1] = '\0';

    if (alphaIndex > 0) {
        printf("The grammar rule has left recursion.\n");
        printf("Eliminated left recursion:\n");
        printf("%c -> %s%c'\n", nonTerminal, beta, nonTerminal);
        printf("%c' -> %s%c'|e\n", nonTerminal, alpha, nonTerminal);
    } else {
        printf("The grammar rule does not have left recursion.\n");
        printf("No changes needed: %c -> %s\n", nonTerminal, production);
    }

    return 0;
}
