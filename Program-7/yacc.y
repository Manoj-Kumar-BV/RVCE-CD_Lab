%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror();
%}

%token NUM IDEN TYPE
%left '-' '+'
%left '*' '/'

%%
S:      FUN     {printf("Accepted\n"); exit(0);} ;
FUN:    TYPE IDEN '(' PARAMS ')' BODY ;
BODY:   S1 ';' | '{' SS '}'
PARAMS: PARAM ',' PARAMS | PARAM | ;
PARAM:  TYPE IDEN;
SS:     S1 ';' SS | ;
S1:     ASSGN | E | DECL ;
DECL:   TYPE IDEN | TYPE ASSGN ;
ASSGN:  IDEN '=' E ;
E:      E'+'E | E'-'E | E'*'E | E'/'E | '-''-'E | '+''+'E | E'+''+' | E'-''-' | T ;
T:      IDEN | NUM ;
%%

int yyerror(){
printf("Error\n");
exit(0);
}

int main(){
printf("Enter Input: \n");
yyparse();
printf("Successfull\n");
return 0;
}
