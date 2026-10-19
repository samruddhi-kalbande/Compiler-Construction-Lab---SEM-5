%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *message);
extern int source_line;
static int parse_error = 0;
%}

%token FOR IDENTIFIER NUMBER
%token LE GE EQ NE AND OR INC DEC INVALID
%right '='
%left OR
%left AND
%left EQ NE
%left '<' '>' LE GE
%left '+' '-'
%left '*' '/'
%right UMINUS '!'

%%

program:
    statement_list
    ;

statement_list:
    statement
    | statement_list statement
    ;

statement:
    for_statement
    | block
    | expression ';'
    | ';'
    ;

for_statement:
    FOR '(' optional_expression ';' optional_expression ';' optional_expression ')' statement
    ;

optional_expression:
    /* empty */
    | expression
    ;

block:
    '{' '}'
    | '{' statement_list '}'
    ;

expression:
    IDENTIFIER '=' expression
    | expression OR expression
    | expression AND expression
    | expression EQ expression
    | expression NE expression
    | expression '<' expression
    | expression '>' expression
    | expression LE expression
    | expression GE expression
    | expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
    | '-' expression %prec UMINUS
    | '!' expression
    | '(' expression ')'
    | IDENTIFIER
    | NUMBER
    | IDENTIFIER INC
    | IDENTIFIER DEC
    | INC IDENTIFIER
    | DEC IDENTIFIER
    ;

%%

void yyerror(const char *message) {
    fprintf(stderr, "Line %d: %s\n", source_line, message);
    parse_error = 1;
}

int main(void) {
    if (yyparse() != 0 || parse_error) {
        return 1;
    }

    puts("Valid FOR-loop syntax.");
    return 0;
}
