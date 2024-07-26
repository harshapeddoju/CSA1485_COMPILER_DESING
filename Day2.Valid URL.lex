%{
int c=0;
%}
%%
["https://"]w{3}["."]{a-z]+".com"|".edu"|".in" {c=1;}
%%
int yywrap(){}
int main()
{
printf("\nEnter URL:");
yylex();
if(c==1)
printf("\nValid.....");
else
printf("\nInvalid.......");
}
