%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror();
int count = 0;
%}

%token TYPE ID NUM

%%

S : DECL ';' {
    printf("Number of variables declared: %d\n", count);
    exit(0);
};

DECL : TYPE LIST ;

LIST : VAR
     | VAR ',' LIST ;

VAR : ID {
            count++;
       }
    | ID '[' NUM ']' {
            count++;
       }
;

%%

int yyerror() {
    printf("Syntax Error\n");
    exit(1);
}

int main() {
    printf("Enter declaration: ");
    yyparse();
    return 0;
}
