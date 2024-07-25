%{
#include <stdio.h>
int vowel_count = 0;
int consonant_count = 0;
%}
%%
[a-zA-Z]    {
                if (yytext[0] == 'a' || yytext[0] == 'e' || yytext[0] == 'i' || yytext[0] == 'o' || yytext[0] == 'u' || yytext[0] == 'A' || yytext[0] == 'E' || yytext[0] == 'I' || yytext[0] == 'O' || yytext[0] == 'U') {
                    vowel_count++;
                } else {
                    consonant_count++;
                }
            }

%%
int yywrap() {
    return 1;
}
int main() {
    printf("Enter a sentence: ");
    yylex();
    printf("Number of vowels: %d\n", vowel_count);
    printf("Number of consonants: %d\n", consonant_count);
    return 0;
}
