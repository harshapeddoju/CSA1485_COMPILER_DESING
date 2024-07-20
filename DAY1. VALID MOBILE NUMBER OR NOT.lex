%{
%}

%%

[6-9][0-9]{9} {printf("\nmobile number valid\n");}

.+  {printf("\nmobile number invalid\n");}

%%
int yywrap(void) {}

int main()
{
   printf("\nEnter Mobile Number : ");
   yylex();
   printf("\n");
   return 0;
}
