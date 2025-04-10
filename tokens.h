#ifndef TOKENS_H
#define TOKENS_H

// Union for token values
typedef union {
    int int_val;
    float float_val;
    char char_val;
    char *string_val;
} YYSTYPE;

extern YYSTYPE yylval;

typedef enum {
    // Keywords
    TOKEN_CLASS, TOKEN_PUBLIC, TOKEN_STATIC, TOKEN_VOID,
    TOKEN_INT, TOKEN_CHAR, TOKEN_BOOLEAN, TOKEN_IF,
    TOKEN_ELSE, TOKEN_WHILE, TOKEN_RETURN, TOKEN_TRUE,
    TOKEN_FALSE, TOKEN_FINAL, TOKEN_PRINT,
    
    // Operators
    TOKEN_PLUS, TOKEN_MINUS, TOKEN_MULTIPLY, TOKEN_DIVIDE,
    TOKEN_MOD, TOKEN_EQ, TOKEN_NEQ, TOKEN_LT, TOKEN_GT,
    TOKEN_LEQ, TOKEN_GEQ, TOKEN_AND, TOKEN_OR, TOKEN_NOT,
    TOKEN_ASSIGN,
    
    // Punctuation
    TOKEN_LPAREN, TOKEN_RPAREN, TOKEN_LBRACE, TOKEN_RBRACE,
    TOKEN_LBRACKET, TOKEN_RBRACKET, TOKEN_SEMICOLON, TOKEN_COMMA,
    
    // Literals and identifiers
    TOKEN_INT_LIT, TOKEN_FLOAT_LIT, TOKEN_CHAR_LIT,
    TOKEN_STRING_LIT, TOKEN_ID
} TokenType;

#endif