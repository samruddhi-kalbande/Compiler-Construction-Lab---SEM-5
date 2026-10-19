%{
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?  { yylval.value = strtod(yytext, NULL); return NUMBER; }
[ \t\r]+                              ;
\n                                    { return '\n'; }
[+\-*/()]                             { return yytext[0]; }
.                                     { return INVALID; }

%%

int yywrap(void) {
    return 1;
}
