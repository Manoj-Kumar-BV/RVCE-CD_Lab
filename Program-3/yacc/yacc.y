%{
#include <stdio.h>
#include <stdlib.h>
int total_for_count = 0;
int current_nesting = 0;
int max_nesting = 0;
int yylex();
int yyerror(const char *s);
%}

%token NUM IDEN FOR OP OP_OP

%%

STMTS:  STMT
     |  STMTS STMT
;

STMT:   FORSTMT
    |IDEN '=' EXPR ';'
|IDEN ';'
|'{' STMTS '}'
|';'
;

FORSTMT:        FOR '(' ASSGN ';' COND ';' ASSGN ')'
                        {
                                total_for_count++;
                                current_nesting++;
                                if(current_nesting > max_nesting){
                                        max_nesting = current_nesting;
                                }
                        }
                        STMT
                        {
                                        current_nesting--;
                        }
                        ;

ASSGN:  IDEN '=' EXPR
     |IDEN OP_OP
|IDEN
;

COND:   IDEN OP IDEN
    |IDEN OP NUM
|IDEN
|NUM
;

EXPR:   IDEN
    |NUM
|IDEN '+' IDEN
|IDEN '-' IDEN
|IDEN '*' IDEN
|IDEN '/' IDEN
;
%%

int yyerror(const char *s){
fprintf(stderr, "Parse Error,%s\n",s);
exit(1);
}

int main(){
printf("Enter the Code Snippet: \n");
yyparse();
printf("Total For Loops: %d\n",total_for_count);
printf("Max Nested Level is: %d\n",max_nesting);
return 0;
}
