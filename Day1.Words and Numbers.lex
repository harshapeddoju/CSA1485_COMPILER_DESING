%{
#include <stdio.h>
%}

%%
[0-9]*	{ printf("\n%s is a Number", yytext);}
[a-zA-Z]*	{ printf("\n%s is a Word", yytext);}

%%
int yywrap(){ return 1; }

int main()
{
	printf("\nEnter the input : ");
	yylex();
	return 0;
}
