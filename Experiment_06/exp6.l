/* 
 * Experiment 6: Conversion of decimal to hexadecimal number in a file
 * Name: Samruddhi Kalbande
 * PRN: 24070521278
 * CO2
 */

%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+   { 
    int num = atoi(yytext);
    printf("0x%X", num);
}
.        { printf("%s", yytext); }
\n       { printf("\n"); }

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
        printf("--- Decimal to Hexadecimal Conversion ---\n\n");
    } else {
        printf("Enter text with numbers (Ctrl+D to end):\n");
    }

    yylex();
    return 0;
}
