%% 
[0-9]+ {printf("\n Valid digit\n");}
.* printf("\nInvalid digit\n");
%%

int yywrap(){}
int main(){
printf("\nEnter input:");
yylex();
}
