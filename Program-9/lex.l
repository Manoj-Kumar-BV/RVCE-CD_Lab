%{
#include "y.tab.h"
%}

%%

"int"|"float"|"char"|"double"|"void"     { return TYPE; }
[a-zA-Z_][a-zA-Z0-9_]*                    { return ID; }
[0-9]+                                    { return NUM; }

[ \t\n] ;  // ignore whitespace
","          { return ','; }
";"          { return ';'; }
"["          { return '['; }
"]"          { return ']'; }

.           { return yytext[0]; }

%%
