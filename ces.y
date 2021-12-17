
%{
#include "heading.h"
int yyerror(char *s);
int symbol_error(string s, string symbol);
extern "C" int yylex();
#include "semantic.h"

SymbolTable symbolTable;
%}

%union{
	int		int_val;
	string* id_val;
	string*	op_val;
}

%start	programa 


%token <op_val> ENTERO
%token <op_val> SIN_TIPO
%token <op_val> RETORNO
%token <op_val> MIENTRAS
%token <op_val> MAIN
%token <op_val> SINO
%token <op_val> SI

%token <int_val> NUM
%token <id_val> ID

%token <op_val> SUM_OP
%token <op_val> RES_OP
%token <op_val> MUL_OP
%token <op_val> DIV_OP

%token <op_val> LT
%token <op_val> LEQ
%token <op_val> GT
%token <op_val> GEQ
%token <op_val> EQ
%token <op_val> NEQ

%token <op_val> ASSIGN

%token <op_val> PAR_BEGIN
%token <op_val> PAR_END
%token <op_val> COR_BEGIN
%token <op_val> COR_END
%token <op_val> BRA_BEGIN
%token <op_val> BRA_END

%token <op_val> D_COM
%token <op_val> COM

%type <id_val> declaracion
%type <id_val> var_declaracion
%type <id_val> fun_declaracion
%type <id_val> call
%type <id_val> more
%type <id_val> param

%%

programa: lista_declaracion 
	;

lista_declaracion:  
	lista_declaracion declaracion {}
	| declaracion {}
	;

declaracion: 
	var_declaracion {$$ = $1;}
	| fun_declaracion {$$ = $1;}
	;

var_declaracion:
	ENTERO ID more {
		extern int yylineno;
		$$ = $2;

		if (!symbolTable.search_symbol_local(*$2)) {
            attr a;
            a.id = var;
            a.v = simple;
            symbolTable.insert_symbol(*$2, a);
        }
        else symbol_error("Simbolo ya definido anteriormente.", *$2);

		cout<<"Declarando variable \""<< *$2 <<"\" de tipo entero en linea " << yylineno << ".\n";}
	| ENTERO ID COR_BEGIN NUM COR_END D_COM {
		$$ = $2;
		extern int yylineno;

		if (!symbolTable.search_symbol_local(*$2)) {
            attr a;
            a.id = var;
            a.v = simple;
            symbolTable.insert_symbol(*$2, a);
        }
        else symbol_error("Simbolo ya definido anteriormente.", *$2);

		cout<<"Declarando arreglo \""<< *$2 <<"\" de tipo entero en linea " << yylineno << ".\n";}
;

fun_declaracion:
	ENTERO MAIN PAR_BEGIN params PAR_END sent_compuesta {cout<<"Función main tipo entero declarada correctamente.\n";}
	| SIN_TIPO MAIN PAR_BEGIN params PAR_END sent_compuesta {cout<<"Función main  sin_tipo declarada correctamente.\n";}
	| ENTERO ID PAR_BEGIN params PAR_END sent_compuesta {
        $$ = $2;
        if (!symbolTable.search_symbol_local(*$2)) {
            attr a;
            a.id = var;
            a.v = simple;
            symbolTable.insert_symbol(*$2, a);
        }
        else symbol_error("Simbolo ya definido anteriormente.", *$2);
		cout<<"Función tipo entero declarada correctamente.\n";}
	| SIN_TIPO ID PAR_BEGIN params PAR_END sent_compuesta{
		$$ = $2;
        if (!symbolTable.search_symbol_local(*$2)) {
            attr a;
            a.id = var;
            a.v = simple;
            symbolTable.insert_symbol(*$2, a);
        }
        else symbol_error("Simbolo ya definido anteriormente.", *$2);
		cout<<"Función sin_tipo declarada correctamente.\n";}
;

params:
    /*empty*/ {
		extern int yylineno;
		cout<<"Función sin parametros en linea " << yylineno << ".\n";}
    | SIN_TIPO { symbolTable.add_scope();
		extern int yylineno;
		cout<<"Función de parametros sin tipo en linea " << yylineno << ".\n";}
	| lista_params { symbolTable.add_scope();
		extern int yylineno;
		cout<<"Función con parametros en linea " << yylineno << ".\n";}
;

lista_params:
    lista_params COM param 
    | param
;

param:
	ENTERO ID COR_BEGIN COR_END{
        if (!symbolTable.search_symbol_local(*$2)) {
            attr a;
            a.id = var;
            a.v = arreglo;
            symbolTable.insert_symbol(*$2, a);
        }
        else symbol_error("Simbolo ya definido anteriormente.", *$2);
    }
	| SIN_TIPO ID COR_BEGIN COR_END{
        if (!symbolTable.search_symbol_local(*$2)) {
            attr a;
            a.id = var;
            a.v = arreglo;
            symbolTable.insert_symbol(*$2, a);
        }
        else symbol_error("Simbolo ya definido anteriormente.", *$2);
    }
    | ENTERO ID {
        if (!symbolTable.search_symbol_local(*$2)) {
            attr a;
            a.id = var;
            a.v = simple;
            symbolTable.insert_symbol(*$2, a);
        }
        else symbol_error("Simbolo ya definido anteriormente.", *$2);
    }
    | SIN_TIPO ID {
        if (!symbolTable.search_symbol_local(*$2)) {
            attr a;
            a.id = var;
            a.v = simple;
            symbolTable.insert_symbol(*$2, a);
        }
        else symbol_error("Simbolo ya definido anteriormente.", *$2);
    }
;

sent_compuesta:
	BRA_BEGIN declaracion_local lista_sentencias BRA_END
;

declaracion_local:
	/*empty*/
	| declaracion_local var_declaracion 
;

more:
    COM ID more {
		extern int yylineno;
		$$ = $2;
        if (!symbolTable.search_symbol_local(*$2)) {
            attr a;
            a.id = var;
            a.v = simple;
            symbolTable.insert_symbol(*$2, a);
        }
        else symbol_error("Simbolo ya definido anteriormente.", *$2);
		cout<<"Declarando variable \""<< *$2 <<"\" en linea " << yylineno << ".\n";
	}
    | COR_BEGIN NUM COR_END more
    | D_COM
;

lista_sentencias: 
	/*empty*/
	| lista_sentencias sentencia
;

sentencia:
	sentencia_seleccion {
		cout<<"Sentencia condicional declarada correctamente.\n";}
	| sentencia_iteracion{
		cout<<"Sentencia condicional declarada correctamente.\n";}
	| sentencia_retorno
	| sentencia_expresion
;

sentencia_expresion:
	expresion D_COM
	| D_COM
;

sentencia_seleccion: 
	SI PAR_BEGIN expresion PAR_END BRA_BEGIN lista_sentencias BRA_END SINO BRA_BEGIN lista_sentencias BRA_END 
	| SI PAR_BEGIN expresion PAR_END BRA_BEGIN lista_sentencias BRA_END
;

sentencia_iteracion:
	MIENTRAS PAR_BEGIN expresion PAR_END BRA_BEGIN lista_sentencias BRA_END
;

sentencia_retorno:
	RETORNO D_COM {
		cout<<"Sentencia de retorno en funcion sin_tipo.\n";}
	| RETORNO expresion D_COM {
		cout<<"Sentencia de retorno procesada correctamente.\n";}
;

expresion:
	var ASSIGN expresion
	| expresion_simple
;

var:
	ID
	|ID COR_BEGIN expresion COR_END
;

expresion_simple:   expresion_aditiva relop expresion_aditiva {}
    |   expresion_aditiva
    ;

relop:    LT  {}
    |   LEQ {}
    |   GT  {}
    |   GEQ {}
    |   EQ {}
    |   NEQ {}
    ;

expresion_aditiva:    expresion_aditiva addop term  {}
    |   term {}
    ;

addop:    SUM_OP {}
    |   RES_OP  {}
    ;

term:   term MUL_OP factor {}
    |   factor  {}
    ;

mulop:    MUL_OP {}
    |   DIV_OP {}
    ;

factor:   PAR_BEGIN expresion PAR_END {}
    |   var {}
    |   call {}
    |   NUM {}
    ;

call:   ID PAR_BEGIN args PAR_END {
		$$ = $1;
		extern int yylineno;
		cout<<"Llamada a función \""<< *$1 <<"\" procesada correctamente en linea "<< yylineno <<".\n";}
    ;

args:   
	/*empty*/
	| lista_arg {}
    ;

lista_arg:    lista_arg COM expresion  {}
    |   expresion  {}
    ;

%%

int yyerror(string s)
{
	extern int yylineno;	// defined and maintained in lex.c
	extern char *yytext;	// defined and maintained in lex.c
	
	cerr << "ERROR: " << s << " at symbol \"" << yytext;
	cerr << "\" on line " << yylineno << endl;
	exit(1);
}

int yyerror(char *s)
{
	return yyerror(string(s));
}

int symbol_error(string s, string symbol) {
    extern int yylineno;
    extern char *yytext;
    
    cerr << "ERROR: " << s << " \"" << symbol;
    cerr << "\" en linea " << yylineno << endl;
    exit(1);
}