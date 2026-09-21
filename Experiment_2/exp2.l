/* 
 * Experiment 2: Count comments, keywords, identifiers, words, lines, spaces
 * Name: Samruddhi Kalbande
 * PRN: 24070521278
 */

%{
    int single_comment = 0, multi_comment = 0;
    int keywords = 0, identifiers = 0;
    int words = 0, lines = 0, spaces = 0;
%}

%%

\/\/.*              { single_comment++; }
\/\*([^*]|\*+[^*/])*\*+\/  { multi_comment++; }

"int"|"float"|"char"|"double"|"if"|"else"|"while"|"for"|"do"|"return"|"void"|"main"|"include"|"printf"|"scanf"|"switch"|"case"|"break"|"continue"|"struct"|"typedef"|"static"|"const"|"sizeof"|"long"|"short"|"unsigned"|"signed"|"enum"|"union"|"extern"|"register"|"volatile"|"goto"|"default"   { keywords++; words++; }

[a-zA-Z_][a-zA-Z0-9_]*   { identifiers++; words++; }

[0-9]+              { words++; }

[ \t]               { spaces++; }
\n                  { lines++; }
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
        printf("Usage: ./a.out <input_file>\n");
        printf("Or enter input manually (Ctrl+D to end):\n");
    }

    yylex();

    printf("\n--- Analysis Results ---\n");
    printf("Single-line Comments : %d\n", single_comment);
    printf("Multi-line Comments  : %d\n", multi_comment);
    printf("Keywords             : %d\n", keywords);
    printf("Identifiers          : %d\n", identifiers);
    printf("Words                : %d\n", words);
    printf("Lines                : %d\n", lines);
    printf("Spaces/Tabs          : %d\n", spaces);

    return 0;
}
