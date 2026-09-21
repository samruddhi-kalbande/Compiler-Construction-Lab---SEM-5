/* 
 * Experiment 5: Conversion of lowercase to uppercase and vice versa
 * Name: Samruddhi Kalbande
 * PRN: 24070521278
 * CO2
 */

%{
#include <stdio.h>
%}

%%

[a-z]   { printf("%c", yytext[0] - 32); }
[A-Z]   { printf("%c", yytext[0] + 32); }
.       { printf("%s", yytext); }
\n      { printf("\n"); }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *f = fopen(argv[1], "r");
        if (!f) {
            printf("Cannot open file %s\n", argv[1]);
            return 1;
        }
        yyin = f;
    } else {
        printf("Enter text (Ctrl+D to end):\n");
    }

    yylex();
    return 0;
}
