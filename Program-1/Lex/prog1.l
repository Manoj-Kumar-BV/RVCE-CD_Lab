%{
  #include <stdio.h>
  int line=1, words=0, chars=0, space=0;
%}

%%
  \n {line++;}
  \t {space+=4;}
  [ ] {space++;}
  [^ \n\t#]+ {word++; chars+=yyleng;}
  # {return 0;}
%%

int main(){
  printf("Enter the string :\n");
  yylex();
  printf("Lines=%d\nWords=%d\nChars=%d\nSpaces=%d\n",line,words,chars,space);
  return 0;
}

int yywrap(){
  return 1;
}
