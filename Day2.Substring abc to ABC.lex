%{
#include <stdio.h>
%}

%%
abc   { printf("ABC"); }
.     { printf("%s", yytext); }
\n    { printf("\n"); }
%%
int yywrap() {}
int main() {
    yylex();
    return 0;
}
