%{
#include <stdio.h>
%}

%%
\<[^>]*\>	fprintf(yyout,"%s\n",yytext);
.|
%%

int yywrap() {}

int main()
{
yyin=fopen("sample.html","r");
yyout=fopen("result.txt","w");
yylex();
}
