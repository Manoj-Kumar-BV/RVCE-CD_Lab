%{
#include <stdio.h>
#include <stdlib.h>
int total_if_count=0;
int current_nesting = 0;
int max_nesting = 0;
int yylex();
int yyerror(const char *s);
%}

%token NUM OP IF IDEN

%%
STMTS:  STMT
     |  STMTS STMT
;

STMT:   IFSTMT
    |IDEN '=' EXPR ';'
|       IDEN ';'
|       '{' STMTS '}'
|       ';'
;

IFSTMT: IF '(' COND ')'
        {
                total_if_count++;
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


COND:   IDEN OP IDEN
    |   IDEN OP NUM
|       IDEN
|       NUM
;

EXPR:   IDEN
    |   NUM
|       IDEN '+' IDEN
|       IDEN '-' IDEN
;
%%

int yyerror(const char *s){
fprintf(stderr, "Parse Error : %s\n",s);
exit(1);
}

int main(){
printf("Enter the Snippet: \n");
yyparse();
printf("Total IF Counts: %d\n",total_if_count);
printf("Maximum Nesting is: %d\n",max_nesting);
return 0;
}
