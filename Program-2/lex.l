%{
#include <stdio.h>
int posint=0, negint=0, posfrac=0, negfrac=0;
%}

num [0-9]+
posint \+?{num}
negint -{num}

posnum {posint}\/{posint}|{negint}\/{negint}
negnum {posint}\/{negint}|{negint}\/{posint}

%%
{posint}        posint++;
{negint}        negint++;
{posnum}        posfrac++;
{negnum}        negfrac++;
[ \t]   ;
[\n]    return 0;
.       ECHO;
%%

int yywrap() {}

int main(){
yylex();
printf("Positive Integers: %d\n",posint);
printf("Negative Integers: %d\n",negint);
printf("Positive Fractions: %d\n",posfrac);
printf("Negative Fractions: %d\n",negfrac);
}
