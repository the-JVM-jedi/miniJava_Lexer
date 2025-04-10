#include "tokens.h"
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern char *yytext;
extern int yylineno;
extern FILE *yyin;

YYSTYPE yylval;

const char *token_names[] = {
    // Keywords
    "CLASS", "PUBLIC", "STATIC", "VOID",
    "INT", "CHAR", "BOOLEAN", "IF",
    "ELSE", "WHILE", "RETURN", "TRUE",
    "FALSE", "FINAL", "PRINT",
    
    // Operators
    "PLUS", "MINUS", "MULTIPLY", "DIVIDE",
    "MOD", "EQ", "NEQ", "LT", "GT",
    "LEQ", "GEQ", "AND", "OR", "NOT",
    "ASSIGN",
    
    // Punctuation
    "LPAREN", "RPAREN", "LBRACE", "RBRACE",
    "LBRACKET", "RBRACKET", "SEMICOLON", "COMMA",
    
    // Literals and identifiers
    "INT_LIT", "FLOAT_LIT", "CHAR_LIT",
    "STRING_LIT", "ID"
};

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("Failed to open file");
        return 1;
    }

    int token;
    while ((token = yylex()) != 0) {
        printf("Line %d: Token %s (%s)\n", yylineno, token_names[token - TOKEN_CLASS], yytext);
    }

    fclose(yyin);
    return 0;
}