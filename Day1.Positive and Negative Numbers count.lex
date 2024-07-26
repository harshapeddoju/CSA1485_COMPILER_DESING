%{
#include<stdio.h>
int pos_no=0,neg_no=0;
%}
%%

[-][0-9]+ {neg_no++; printf("negative number=%s\n",yytext);}
[0-9]+ {pos_no; printf("positive number=%s\n",yytext);}
%%

int yywrap(){
return 1;
}

int main(){
printf("\nEnter number:");
yylex();
printf("\n");
}
