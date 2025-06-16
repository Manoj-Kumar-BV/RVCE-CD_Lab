%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
typedef char *string;
struct{
        string res, op1, op2;
        char op;
}code[100];
int idx = -1;
string addtotable(string, string, char);
void targetcode();
%}

%union{
        char *exp;
}
%token <exp> NUM IDEN
%type <exp> EXP
%right '='
%left '-' '+'
%left '*' '/'

%%
STMTS:  STMTS STMT
     |
;

STMT:   EXP '\n'
    ;

EXP:    IDEN '=' EXP    {$$ = addtotable($1,$3,'=');}
   |    EXP '+' EXP     {$$ = addtotable($1,$3,'+');}
|       EXP '-' EXP     {$$ = addtotable($1,$3,'-');}
|       EXP '*' EXP     {$$ = addtotable($1,$3,'*');}
|       EXP '/' EXP     {$$ = addtotable($1,$3,'/');}
|       '(' EXP ')'     {$$ = $2;}
|       IDEN    {$$ = $1;}
|       NUM     {$$ = $1;}
;
%%

int yyerror(const char *s){
printf("Error: %s\n",s);
exit(0);
}

int main(){
yyparse();
printf("Target Code:\n");
targetcode();
}

string addtotable(string op1, string op2, char op){
        if(op == '='){
                code[idx].res = op1;
                return op1;
        }
        idx++;
        string res = malloc(3);
        sprintf(res, "@%c", idx+'A');
        code[idx].op1 = op1;
        code[idx].op2 = op2;
        code[idx].op = op;
        code[idx].res = res;
        return res;
}

void targetcode(){
        for(int i=0; i<=idx; i++){
                string instr;
                switch(code[i].op){
                        case '+': instr = "ADD"; break;
                        case '-': instr = "SUB"; break;
                        case '*': instr = "MUL"; break;
                        case '/': instr = "DIV"; break;
                }

                printf("LOAD\t R1, %s\n",code[i].op1);
                printf("LOAD\t R2, %s\n",code[i].op2);
                printf("%s\n, R3, R1, R2\n",instr);
                printf("STORE\t %s, R3\n",code[i].res);
        }
}
