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
    case Categoria::ID:
      os << "Identificador";
      break;
    case Categoria::NUMERO:
      os << "Numero";
      break;
    case Categoria::REL_OP:
      os << "RelOp";
      break;
    case Categoria::ASSIGN:
      os << "Assign";
      break;
    case Categoria::MUL_OP:
      os << "Multiplicate";
      break;
    case Categoria::PAR_BEGIN:
      os << "Parenthesis Begin";
      break;
    case Categoria::PAR_END:
      os << "Parenthesis End";
      break;
    case Categoria::IF:
      os << "Conditional If";
      break;
    case Categoria::ELSE:
      os << "Conditional Else";
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
