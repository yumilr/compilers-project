#pragma once

#include <iostream>

#include "Enums.h"

class Token {
 public:
	std::string _lexema;
	Categoria _atributo;

	Token(std::string lexema, Categoria atributo)
			: _lexema(lexema), _atributo(atributo) {}

	Token() : _lexema(""), _atributo(END) {}

	bool operator==(const Token& in) const {
		return in._lexema == this->_lexema && in._atributo == this->_atributo;
	}
};

//Allows printing Tokens on the Google Test failing reports
std::ostream& operator<<(std::ostream& os, Token token) {
	os << "<";
	switch (token._atributo) {
		case Categoria::INT:
			os << "Entero";
			break;
		case Categoria::NO_TYPE:
			os << "Sin tipo";
			break;			
		case Categoria::ID:
			os << "Identificador";
			break;
		case Categoria::NUM:
			os << "Numero";
			break;
		case Categoria::REL_OP:
			os << "RelOp";
			break;
		case Categoria::ASSIGN:
			os << "Assign Op";
			break;
		case Categoria::ARIT_OP:
			os << "Arithmetic Op";
			break;
		case Categoria::MUL_OP:
			os << "Multiplicate";
			break;
		case Categoria::DIV_OP:
			os << "Divide";
			break;			
		case Categoria::PAR_BEGIN:
			os << "Parenthesis Begin";
			break;
		case Categoria::PAR_END:
			os << "Parenthesis End";
			break;
		case Categoria::COR_BEGIN:
			os << "Corchete Begin";
			break;
		case Categoria::COR_END:
			os << "Corchete End";
			break;
		case Categoria::BRA_BEGIN:
			os << "Bracket Begin";
			break;
		case Categoria::BRA_END:
			os << "Bracket End";
			break;
		case Categoria::IF:
			os << "Conditional If";
			break;
		case Categoria::WHILE:
			os << "Loop";
			break;
		case Categoria::MAIN:
			os << "Main";
			break;		
		case Categoria::ELSE:
			os << "Conditional Else";
			break;
		case Categoria::RETURN:
			os << "Return";
			break;
		case Categoria::D_COM:
			os << "Punto y coma";
			break;
		case Categoria::COM:
			os << "Coma";
			break;								
		case Categoria::ERROR:
			os << "Error";
			break;
		default:
			os << "Sin Categoria";
			break;
	}
	os << ", " << token._lexema << ">";
	return os;
}
