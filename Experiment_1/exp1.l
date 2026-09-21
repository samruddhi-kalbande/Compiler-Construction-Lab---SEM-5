/* 
 * Experiment 1: Introduction to LEX tool, metadata and patterns
 * Name: Samruddhi Kalbande
 * PRN: 24070521278
 */

%{
    int vowels = 0, consonants = 0, digits = 0, spaces = 0, words = 0, lines = 0, special = 0;
%}

%%

[aeiouAEIOU]        { vowels++; }
[a-zA-Z]            { consonants++; }
[0-9]               { digits++; }
[ \t]               { spaces++; }
\n                  { lines++; }
.                   { special++; }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    printf("Enter the input (Ctrl+D to end):\n");
    yylex();

    printf("\n--- Metadata Summary ---\n");
    printf("Vowels      : %d\n", vowels);
    printf("Consonants  : %d\n", consonants);
    printf("Digits      : %d\n", digits);
    printf("Spaces/Tabs : %d\n", spaces);
    printf("Lines       : %d\n", lines);
    printf("Special Chars: %d\n", special);

    return 0;
}
