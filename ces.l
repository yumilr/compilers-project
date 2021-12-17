/* Mini Calculator */
/* ces.lex */

%{
#include "heading.h"
// #include "y.tab.h" 
#include "tok.h"
extern "C" int yylex();
int yyerror(char *s);
%}

ID      {LETRA}+
uint     {DIGIT}+
DIGIT   [0-9]
LETRA   [a-z|A-Z|_]
DELIM   [ \t]*
ws      {DELIM}+

digit		[0-9]
int_const	{digit}+

%%

"\n"		{ yylineno++;	}
{ws}		{}

entero   { yylval.op_val = new std::string(yytext); return ENTERO; }
sin_tipo {yylval.op_val = new std::string(yytext); return SIN_TIPO;}
retorno  {yylval.op_val = new std::string(yytext); return RETORNO;}
main {yylval.op_val = new std::string(yytext); return MAIN;}
mientras {yylval.op_val = new std::string(yytext); return MIENTRAS;}
sino {yylval.op_val = new std::string(yytext); return SINO;}
si {yylval.op_val = new std::string(yytext); return SI;}

{uint}	{ yylval.int_val = atoi(yytext); return NUM; }
{ID}     { yylval.id_val = new std::string(yytext); return ID;}

"+"		{ yylval.op_val = new std::string(yytext); return SUM_OP; }
"-"		{ yylval.op_val = new std::string(yytext); return RES_OP; }
"*"		{ yylval.op_val = new std::string(yytext); return MUL_OP; }
"/"		{ yylval.op_val = new std::string(yytext); return DIV_OP; }

"<="    {yylval.op_val = new std::string(yytext); return LEQ;}
"<"     {yylval.op_val = new std::string(yytext); return LT;}
">="    {yylval.op_val = new std::string(yytext); return GEQ;}
">"     {yylval.op_val = new std::string(yytext); return GT;}
"="     {yylval.op_val = new std::string(yytext); return ASSIGN;}
"=="    {yylval.op_val = new std::string(yytext); return EQ;}
"!="    {yylval.op_val = new std::string(yytext); return NEQ;}

"("     {yylval.op_val = new std::string(yytext); return PAR_BEGIN;}
")"     {yylval.op_val = new std::string(yytext); return PAR_END;}
"["     {yylval.op_val = new std::string(yytext); return COR_BEGIN;}
"]"     {yylval.op_val = new std::string(yytext); return COR_END;}
"{"     {yylval.op_val = new std::string(yytext); return BRA_BEGIN;}
"}"     {yylval.op_val = new std::string(yytext); return BRA_END;}

";"     {yylval.op_val = new std::string(yytext); return D_COM;}
","     {yylval.op_val = new std::string(yytext); return COM;}

"/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/" /* Ignora este token */ 

.		{ std::cerr << "SCANNER "; yyerror(""); exit(1);	}
