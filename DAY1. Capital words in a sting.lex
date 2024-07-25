%{
#include <stdio.h>
%}
%%
[A-Z][a-z]*	{ printf("\n capital word : %s\n", yytext);}
%%
int yywrap(){ return 1; }
int main()
{
	printf("\nEnter a string : ");
	yylex();
	return 0;
}
