%{
#include <stdio.h>
#include <stdlib.h>
int yyerror();
int yylex();
%}

%%
S:A B
;
A:'a'A'b'
|
;
B:'b'B'c'
|
;
%%

int main(){
printf("Enter the Input: \n");
yyparse();
printf("Valid Input\n");
}

int yyerror(){
printf("Invalid Input\n");
exit(0);
}
