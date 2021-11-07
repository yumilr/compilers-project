#include <gtest/gtest.h>

#include <strstream>

#include "FlexScanner.hpp"

using namespace utec::compilers;

TEST(SimpleTest, basicTest) {
  std::istrstream str("a=-2.7E4");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END) break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {Token("a", Categoria::ID),
                                 Token("=", Categoria::ASSIGN),
                                 Token("-2.7E4", Categoria::NUM)};
  EXPECT_EQ(tokens, expected);
}

TEST(CommentTest, hasComments) {
  std::istrstream str("a = b /* shouldn't be printed */ c = d");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END) break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {Token("a", Categoria::ID),
                                 Token("=", Categoria::ASSIGN),
                                 Token("b", Categoria::ID),
                                 Token("c", Categoria::ID),
                                 Token("=", Categoria::ASSIGN),
                                 Token("d", Categoria::ID)};
  EXPECT_EQ(tokens, expected);
}

TEST(ErrorTest, basicTest) {
  std::istrstream str("a = b\n@");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END) break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {Token("a", Categoria::ID),
                                 Token("=", Categoria::ASSIGN),
                                 Token("b", Categoria::ID),
                                 Token("@", Categoria::ERROR),
                                 };
  EXPECT_EQ(tokens, expected);
}

TEST(MyTest, basicTest) {
  std::istrstream str("a = if(b == a) 23 @");

  FlexScanner scanner(str, std::cout);
  std::vector<Token> tokens;

  while (1) {
    auto token = scanner.get_token();
    if (token._atributo == END) break;
    tokens.push_back(token);
  }

  std::vector<Token> expected = {Token("a", Categoria::ID),
                                 Token("=", Categoria::ASSIGN),
                                 Token("if", Categoria::IF),
                                 Token("(", Categoria::PAR_BEGIN),
                                 Token("b", Categoria::ID),
                                 Token("==", Categoria::REL_OP),
                                 Token("a", Categoria::ID),
                                 Token(")", Categoria::PAR_END),
                                 Token("23", Categoria::NUMERO),
                                 Token("@", Categoria::ERROR),
                                 };
  EXPECT_EQ(tokens, expected);
}

int main(int argc, char** argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}