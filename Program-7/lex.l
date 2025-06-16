%{
#include "y.tab.h"
%}

%%
"int"|"float"|"char"|"void"     return TYPE;
[\t\n ] ;
[a-zA-Z][a-zA-Z0-9]*    return IDEN;
[0-9]+  return NUM;
.       return yytext[0];
%%
