%{
#include <stdio.h>
int id=0, key=0,op = 0;
%}

%%
"int"|"float"|"double"|"char"|"if"|"else"|"for"|"exit"|"return"|"while" { printf("Keyword\n"); key++; }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("Identifier\n"); id++; }
[\+\-\*\/\%\^\&\!\=]    { printf("Operator\n"); op++; }
[ \t\n;]        ;
.       { printf("Invalid\n"); }
%%

int yywrap(){
return 1;
}

int main(){
printf("Enter Anything: \n");
yylex();
printf("Identifiers: %d\nOperators: %d\nKeywords: %d\n",id,op,key);
return 0;
}
