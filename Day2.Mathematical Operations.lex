%{
#include <stdio.h>
%}

%%

[A-Za-z]+	{ printf("\nWord : %s\n", yytext);}
[0-9]+	{ printf("\nOperand: %s\n",yytext); }
"+"	{ printf("\nmathematical Operator: %s\n", yytext); }
"-"	{ printf("\nmathematical Operator: %s\n", yytext); }
"*"    	{ printf("\nmathematical operator %s\n", yytext); }
"/"	{ printf("\nmathematical Operator: %s\n", yytext); }

%%
int yywrap(){ return 1; }

int main()
{
	printf("\nEnter the input : ");
	yylex();
	return 0;
}
