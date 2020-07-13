%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "gram.tab.h"
	FILE *out;
%}

%%
"liczba" return INT;
"jezeli" return IF;
"nastepnie" return THEN;
"w przeciwnym razie" return ELSE;
"dopoki" return WHILE;
"zrob" return DO;
"wyswietl" return READ;
"(" return LPAR;
")" return RPAR;
"{" return LCBRA;
"}" return RCBRA;
"+" return ADD;
"-" return SUB;
"*" return MUL;
"/" return DIV;
"=" return ASSIGN;
"==" return EQ;
"!=" return NOTEQ;
">" return GT;
"<" return LT;
">=" return GTEQ;
"<=" return LTEQ;
"i" return AND;
"albo" return OR;
"//".*"\n" return COM;
[a-zA-z][a-zA-Z0-9]* {yylval = *yytext; return VAR;}
[0-9]+ {yylval = atoi(yytext); return NUM;}
%%

int main(int argc, char const *argv[]){
	if (argc > 1){
		yyin = fopen(argv[1], "r");
		if (yyin){
			printf("\033[0;33m");
			printf("kompiluje: %s\nProszę czekać...\n", argv[1]);
			printf("\033[0m");
			out = fopen("temp.txt", "w");

			yyparse();
			fclose(out); 
			fclose(yyin);
		} else { printf("Nie nie zdatny do odczytu\n"); }
	} return 0;
}
