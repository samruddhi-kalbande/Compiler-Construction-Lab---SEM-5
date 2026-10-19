/* 
 * Experiment 7: Test lines ending with "COM"
 * Name: Samruddhi Kalbande
 * PRN: 24070521278
 * CO3
 */

%{
#include <stdio.h>
#include <string.h>

int com_lines = 0;
int total_lines = 0;
char line_buffer[1024];
int buf_pos = 0;
%}

%%

.*COM\n   { 
    total_lines++;
    com_lines++;
    /* Remove trailing newline for display */
    yytext[yyleng - 1] = '\0';
    printf("Line %d (ends with COM): %s\n", total_lines, yytext);
}

.*\n      { 
    total_lines++;
}

.+        {
    /* Handle last line without newline */
    total_lines++;
    if (yyleng >= 3 && strcmp(yytext + yyleng - 3, "COM") == 0) {
        com_lines++;
        printf("Line %d (ends with COM): %s\n", total_lines, yytext);
    }
}

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
        printf("Enter lines of text (Ctrl+D to end):\n");
    }

    yylex();

    printf("\n--- Results ---\n");
    printf("Total lines              : %d\n", total_lines);
    printf("Lines ending with 'COM'  : %d\n", com_lines);

    return 0;
}
