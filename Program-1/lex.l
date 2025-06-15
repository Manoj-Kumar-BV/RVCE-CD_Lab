%{
#include <stdio.h>
int lines=0, words=0, chars=0, spaces=0;
%}

%%
[ ]             {spaces++;}
\t              {spaces++;}
\n              {lines++;}
[^ \t\n#]+      {words++;chars+=yyleng;}
#               {return 0;}
%%

int yywrap(){
return 1;
}

int main(){
printf("Enter the paragraph or string: \n");
yylex();
printf("Lines: %d\nCharacters: %d\nWords: %d\nSpaces: %d\n",lines,chars,words,spaces);
return 0;
}
