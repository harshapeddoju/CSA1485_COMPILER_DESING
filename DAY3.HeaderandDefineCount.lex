%{
#include <stdio.h>

int macro_count = 0;
int header_count = 0;
%}

%%
"#define"[ \t]+[^ \t\n]+           { macro_count++; }
"#include"[ \t]+"<[^>]+>"          { header_count++; }
"#include"[ \t]+"\"[^\"]+\""       { header_count++; }

/\*([^*]|\*+[^*/])*\*+/	{ /* Ignore block comments */ }
"//".*	{ /* Ignore single line comments */ }
\"(\\.|[^\\"])*\"	{ /* Ignore string literals */ }
\'(\\.|[^\\'])\'	{ /* Ignore character literals */ }
.|\n	{ /* Ignore other characters */ }
%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <input file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("fopen");
        return 1;
    }

    yyin = file;
    yylex();
    fclose(file);

    printf("Number of macros defined: %d\n", macro_count);
    printf("Number of header files included: %d\n", header_count);

    return 0;
}

int yywrap() {
    return 1;
}
