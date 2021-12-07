%{
#include "Enums.h"
/*
{LETRA}+" "+{LETRA}+{MUL_OP} return Categoria::ID;
[+-]?{NUM}+" "{NUM}+{MUL_OP} return Categoria::NUM; 

*/
%}

%option noyywrap c++

NUM     [0-9]
LETRA   [a-z|A-Z|_]
DELIM   [ \t\n]
ws      {DELIM}+
MUL_OP  [*]

OP      [<=|>=|==|=|*]
%%


entero return Categoria::INT;
retorno return Categoria::RETURN;
sin_tipo return Categoria::NO_TYPE;
mientras return Categoria::WHILE;
si return Categoria::IF;  /*SIN COMILLAS UWUWUWUWU*/
sino return Categoria::ELSE;
main return Categoria::MAIN;

[+-]+ return Categoria::ARIT_OP;
{MUL_OP}+ return Categoria::MUL_OP;
"/" return Categoria::DIV_OP;
"<" return Categoria::REL_OP;
"<=" return Categoria::REL_OP;
">" return Categoria::REL_OP;
">=" return Categoria::REL_OP;
"==" return Categoria::REL_OP;
"!=" return Categoria::REL_OP;
"=" return Categoria::ASSIGN;
; return Categoria::D_COM;
, return Categoria::COM;
"(" return Categoria::PAR_BEGIN;
")" return Categoria::PAR_END;
"[" return Categoria::COR_BEGIN;
"]" return Categoria::COR_END;
"{" return Categoria::BRA_BEGIN;
"}" return Categoria::BRA_END;

{LETRA}+ return Categoria::ID;
[+-]?{NUM}+ return Categoria::NUM;

{ws} /* Ignora este token */ 

"/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/" /* Ignora este token */ 



. return Categoria::ERROR;
%%
