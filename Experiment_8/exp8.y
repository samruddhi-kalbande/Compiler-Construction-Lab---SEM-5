%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *message);
static int line_error = 0;
%}

%union {
    double value;
}

%token <value> NUMBER
%token INVALID
%type <value> expression

%%

input:
    /* empty */
    | input line
    ;

line:
    '\n'
    | expression '\n' {
        if (!line_error) {
            printf("Result = %.10g\n", $1);
        }
        line_error = 0;
    }
    | error '\n' {
        yyerrok;
        line_error = 0;
    }
    ;

expression:
    NUMBER                         { $$ = $1; }
    | expression expression '+'    { $$ = $1 + $2; }
    | expression expression '-'    { $$ = $1 - $2; }
    | expression expression '*'    { $$ = $1 * $2; }
    | expression expression '/'    {
        if ($2 == 0.0) {
            yyerror("division by zero");
            $$ = 0.0;
        } else {
            $$ = $1 / $2;
        }
    }
    ;

%%

void yyerror(const char *message) {
    fprintf(stderr, "Error: %s\n", message);
    line_error = 1;
}

int main(void) {
    return yyparse() != 0;
}
