%{
#include <stdio.h>
int single=0, multi=0, mline=0;
FILE *commentFile;
%}

%%
"//"[^\n]*      {single++; fprintf(commentFile, "%s\n", yytext);}
"/*"(.|\n)*?"*/"        {
                                multi++;
                                for(int i=0; i<yyleng; i++){
                                        if(yytext[i] == '\n')
                                                mline++;
                                }
                                fprintf(commentFile, "%s\n", yytext);
                        }
.       { fprintf(yyout, "%s", yytext); }
%%

int yywrap(){
return 1;
}

int main(){
yyin = fopen("input.txt", "r");
yyout = fopen("output.txt", "w");
commentFile = fopen("comments.txt","w");
yylex();
printf("Single: %d\nMulti: %d\nMLine: %d\n", single, multi, mline);
return 0;
}
