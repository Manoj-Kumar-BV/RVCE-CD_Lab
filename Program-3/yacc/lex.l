%{
#include "y.tab.h"
%}

%%
"for"   return FOR;
"++"    return OP_OP;
"--"    return OP_OP;
">"|"<"|">="|"<="|"=="|"!="     return OP;
[a-zA-Z][a-zA-Z0-9]*    return IDEN;
[0-9]+  return NUM;
[\t\n ] ;
.       return yytext[0];
%%
