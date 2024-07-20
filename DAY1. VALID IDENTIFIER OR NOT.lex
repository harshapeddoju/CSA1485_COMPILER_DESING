%{
#include<stdio.h>
%}

%%

[a-zA-Z][a-zA-Z0-9]+ {printf("\nis Identifier",yytext);}
.+ {printf("\n%s is not an Identifier",yytext);}

%%
int yywrap(){}
int main()
{
while(yylex());
}
