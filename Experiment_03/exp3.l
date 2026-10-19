/* 
 * Experiment 3: Count number of words starting with "A"
 * Name: Samruddhi Kalbande
 * PRN: 24070521278
 * CO1
 */

%{
    int count_A = 0;
    int total_words = 0;
%}

%%

[Aa][a-zA-Z0-9]*   { count_A++; total_words++; printf("Word starting with A/a: %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9]*  { total_words++; }
[ \t\n]             { ; }
.                   { ; }

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
        printf("Enter input (Ctrl+D to end):\n");
    }

    yylex();

    printf("\n--- Results ---\n");
    printf("Total words                   : %d\n", total_words);
    printf("Words starting with 'A' or 'a': %d\n", count_A);

    return 0;
}
