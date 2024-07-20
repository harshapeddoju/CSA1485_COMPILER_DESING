%{
#include<stdio.h>
%}

%%
[A-Za-z]+	{ 
		if ( yytext[0] == 'a' || yytext[0] == 'e' || yytext[0] == 'i' || yytext[0] == 'o' || yytext[0] == 'u' || yytext[0] == 'A' || yytext[0] == 'E' || yytext[0] == 'I' || yytext[0] == 'O' || yytext[0] == 'U' ) 
			{ 
				printf("\n String %s is accepted", yytext);
			}
		else 
			{
				printf("\n String %s is not accepted", yytext);
			}
	}


%%

int yywrap(){ return 1; }

int main()
{
	printf("\nEnter a string : ");
	yylex();
	return 0;
}
