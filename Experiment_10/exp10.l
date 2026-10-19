%{
#include "y.tab.h"

int source_line = 1;
%}

%%

"for"                       { return FOR; }
"<="                        { return LE; }
">="                        { return GE; }
"=="                        { return EQ; }
"!="                        { return NE; }
"&&"                        { return AND; }
"||"                        { return OR; }
"++"                        { return INC; }
"--"                        { return DEC; }
[a-zA-Z_][a-zA-Z0-9_]*      { return IDENTIFIER; }
[0-9]+(\.[0-9]+)?           { return NUMBER; }
[ \t\r]+                    ;
\n                          { source_line++; }
[(){};=<>+\-*/!]            { return yytext[0]; }
.                           { return INVALID; }

%%

int yywrap(void) {
    return 1;
}
