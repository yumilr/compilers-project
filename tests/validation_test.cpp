#include <gtest/gtest.h>

#include <strstream>

#include "FlexScanner.hpp"

using namespace utec::compilers;

TEST(SimpleTest, basicTest) {
  std::istrstream str("entero a = 45;entero bde = 56; sin_tipo c;");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END)
      break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {Token("entero", Categoria::INT),
                                 Token("a", Categoria::ID),
                                 Token("=", Categoria::ASSIGN),
                                 Token("45", Categoria::NUM),
                                 Token(";", Categoria::D_COM),
                                 Token("entero", Categoria::INT),
                                 Token("bde", Categoria::ID),
                                 Token("=", Categoria::ASSIGN),
                                 Token("56", Categoria::NUM),
                                 Token(";", Categoria::D_COM),
                                 Token("sin_tipo", Categoria::NO_TYPE),
                                 Token("c", Categoria::ID),
                                 Token(";", Categoria::D_COM)};
  EXPECT_EQ(tokens, expected);
}

TEST(CommentTest, hasComments) {
  std::istrstream str(" entero aed = 45; /* ahh mi vida; *e */ sin_tipo c;");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END)
      break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {Token("entero", Categoria::INT),
                                 Token("aed", Categoria::ID),
                                 Token("=", Categoria::ASSIGN),
                                 Token("45", Categoria::NUM),
                                 Token(";", Categoria::D_COM),
                                 Token("sin_tipo", Categoria::NO_TYPE),
                                 Token("c", Categoria::ID),
                                 Token(";", Categoria::D_COM)};
  EXPECT_EQ(tokens, expected);
}

TEST(ErrorTest, basicTest) {
  std::istrstream str(" entero a_d = 45; sin_tipo %r&;");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END)
      break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {Token("entero", Categoria::INT),
                                 Token("a_d", Categoria::ID),
                                 Token("=", Categoria::ASSIGN),
                                 Token("45", Categoria::NUM),
                                 Token(";", Categoria::D_COM),
                                 Token("sin_tipo", Categoria::NO_TYPE),
                                 Token("%", Categoria::ERROR),
                                 Token("r", Categoria::ID),
                                 Token("&", Categoria::ERROR),
                                 Token(";", Categoria::D_COM)};
  EXPECT_EQ(tokens, expected);
}

TEST(CommentTest2, hasComments) {
  std::istrstream str(" /*Test de puro comentario owo*/ ");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END)
      break;
    tokens.push_back(token);
  }

  

  std::vector<Token> expected = {};
  EXPECT_EQ(tokens, expected);
}


TEST(MyFunction, basicTest) {
  std::istrstream str("entero mi_funcion(entero varr, entero var){ retorno varr + var; }");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END)
      break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {
      Token("entero", Categoria::INT), Token("mi_funcion", Categoria::ID),
      Token("(", Categoria::PAR_BEGIN), Token("entero", Categoria::INT),
      Token("varr", Categoria::ID), Token(",", Categoria::COM),
      Token("entero", Categoria::INT), Token("var", Categoria::ID),
      Token(")", Categoria::PAR_END), Token("{", Categoria::BRA_BEGIN),
      Token("retorno", Categoria::RETURN), Token("varr", Categoria::ID),
      Token("+", Categoria::ARIT_OP), Token("var", Categoria::ID),
      Token(";", Categoria::D_COM), Token("}", Categoria::BRA_END)};
  EXPECT_EQ(tokens, expected);
}

TEST(MyVoid, basicTest) {
  std::istrstream str("sin_tipo mi_funcion(sin_tipo varr, entero var){ varr = var; }");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END)
      break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {
      Token("sin_tipo", Categoria::NO_TYPE), Token("mi_funcion", Categoria::ID),
      Token("(", Categoria::PAR_BEGIN), Token("sin_tipo", Categoria::NO_TYPE),
      Token("varr", Categoria::ID), Token(",", Categoria::COM),
      Token("entero", Categoria::INT), Token("var", Categoria::ID),
      Token(")", Categoria::PAR_END), Token("{", Categoria::BRA_BEGIN),
      Token("varr", Categoria::ID), Token("=", Categoria::ASSIGN), 
      Token("var", Categoria::ID), Token(";", Categoria::D_COM), 
      Token("}", Categoria::BRA_END)};
  EXPECT_EQ(tokens, expected);
}

TEST(MyPoint, basicTest) {
  std::istrstream str(" entero no_point(entero v){entero p = v; retorno p;} ");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END)
      break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {
      Token("entero", Categoria::INT), Token("no_point", Categoria::ID), 
      Token("(", Categoria::PAR_BEGIN), Token("entero", Categoria::INT), 
      Token("v", Categoria::ID), Token(")", Categoria::PAR_END), 
      Token("{", Categoria::BRA_BEGIN), Token("entero", Categoria::INT),
      Token("p", Categoria::ID), Token("=", Categoria::ASSIGN),
      Token("v", Categoria::ID), Token(";", Categoria::D_COM),
      Token("retorno", Categoria::RETURN), Token("p", Categoria::ID),
      Token(";", Categoria::D_COM), Token("}", Categoria::BRA_END)};
  EXPECT_EQ(tokens, expected);
}

TEST(MyLoop, basicTest) {
  std::istrstream str(" entero mi_loop(entero a, b = 20){ entero c = a; mientras(b != 0){ c++; b--;} retorno c;} ");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END)
      break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {
      Token("entero", Categoria::INT), Token("mi_loop", Categoria::ID),
      Token("(", Categoria::PAR_BEGIN), Token("entero", Categoria::INT),
      Token("a", Categoria::ID), Token(",", Categoria::COM),
      Token("b", Categoria::ID), Token("=", Categoria::ASSIGN),
      Token("20", Categoria::NUM), Token(")", Categoria::PAR_END),
      Token("{", Categoria::BRA_BEGIN), Token("entero", Categoria::INT),
      Token("c", Categoria::ID), Token("=", Categoria::ASSIGN),
      Token("a", Categoria::ID), Token(";", Categoria::D_COM),
      Token("mientras", Categoria::WHILE), Token("(", Categoria::PAR_BEGIN),
      Token("b", Categoria::ID), Token("!=", Categoria::REL_OP),
      Token("0", Categoria::NUM), Token(")", Categoria::PAR_END),
      Token("{", Categoria::BRA_BEGIN), Token("c", Categoria::ID),
      Token("++", Categoria::ARIT_OP), Token(";", Categoria::D_COM),
      Token("b", Categoria::ID), Token("--", Categoria::ARIT_OP),
      Token(";", Categoria::D_COM), Token("}", Categoria::BRA_END),
      Token("retorno", Categoria::RETURN), Token("c", Categoria::ID), 
      Token(";", Categoria::D_COM), Token("}", Categoria::BRA_END)};
  EXPECT_EQ(tokens, expected);
}

TEST(MyRecursive, basicTest) {
  std::istrstream str(" entero r_fun(entero a){ a++; retorno fun(a); } ");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END)
      break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {
      Token("entero", Categoria::INT), Token("r_fun", Categoria::ID),
      Token("(", Categoria::PAR_BEGIN), Token("entero", Categoria::INT),
      Token("a", Categoria::ID), Token(")", Categoria::PAR_END),
      Token("{", Categoria::BRA_BEGIN), Token("a", Categoria::ID),
      Token("++", Categoria::ARIT_OP), Token(";", Categoria::D_COM),
      Token("retorno", Categoria::RETURN), Token("fun", Categoria::ID), 
      Token("(", Categoria::PAR_BEGIN), Token("a", Categoria::ID), 
      Token(")", Categoria::PAR_END), Token(";", Categoria::D_COM), 
      Token("}", Categoria::BRA_END)};
  EXPECT_EQ(tokens, expected);
}


TEST(MyConditional, basicTest) {
  std::istrstream str(" entero mi_if(entero a, entero b){ si(a > 10) b = b * 2; sino b = b * 3; retorno b; } ");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END)
      break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {
      Token("entero", Categoria::INT), Token("mi_if", Categoria::ID),
      Token("(", Categoria::PAR_BEGIN), Token("entero", Categoria::INT),
      Token("a", Categoria::ID), Token(",", Categoria::COM),
      Token("entero", Categoria::INT), Token("b", Categoria::ID),
      Token(")", Categoria::PAR_END), Token("{", Categoria::BRA_BEGIN),
      Token("si", Categoria::IF), Token("(", Categoria::PAR_BEGIN),
      Token("a", Categoria::ID), Token(">", Categoria::REL_OP),
      Token("10", Categoria::NUM), Token(")", Categoria::PAR_END), 
      Token("b", Categoria::ID), Token("=", Categoria::ASSIGN), 
      Token("b", Categoria::ID), Token("*", Categoria::MUL_OP),  
      Token("2", Categoria::NUM), Token(";", Categoria::D_COM), 
      Token("sino", Categoria::ELSE), Token("b", Categoria::ID),
      Token("=", Categoria::ASSIGN), Token("b", Categoria::ID),
      Token("*", Categoria::MUL_OP), Token("3", Categoria::NUM),
      Token(";", Categoria::D_COM), Token("retorno", Categoria::RETURN),
      Token("b", Categoria::ID), Token(";", Categoria::D_COM), 
      Token("}", Categoria::BRA_END)};
  EXPECT_EQ(tokens, expected);
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}