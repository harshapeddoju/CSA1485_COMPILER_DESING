%{
#include <stdio.h>
%}

%%

[A-Za-z]*	{ printf("\nWord : %s\n", yytext);}
"=="	{ printf("\nRelational Operator: %s\n", yytext); }
"!="	{ printf("\nRelational Operator: %s\n", yytext); }
"<="    	{ printf("\nRelational Operator: %s\n", yytext); }
">="	{ printf("\nRelational Operator: %s\n", yytext); }
"<" 	{ printf("\nRelational Operator: %s\n", yytext); }
">"	{ printf("\nRelational Operator: %s\n", yytext); }

%%
int yywrap(){ return 1; }

int main()
{
	printf("\nEnter the input : ");
	yylex();
	return 0;
}
