%{
#include "tokens.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern int yylineno;
extern YYSTYPE yylval;

char process_char_literal(const char *text);
void yyerror(const char *msg);

%}

%option noyywrap
%option yylineno

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT}|_)*
INT_LIT     {DIGIT}+
FLOAT_LIT   {DIGIT}+\.{DIGIT}*
CHAR_LIT    \'([^\\\']|\\.)\'
STRING_LIT  \"([^\\\"]|\\.)*\"
WHITESPACE  [ \t\r\f]+
NEWLINE     \n

%%

"class"     { return TOKEN_CLASS; }
"public"    { return TOKEN_PUBLIC; }
"static"    { return TOKEN_STATIC; }
"void"      { return TOKEN_VOID; }
"int"       { return TOKEN_INT; }
"char"      { return TOKEN_CHAR; }
"boolean"   { return TOKEN_BOOLEAN; }
"if"        { return TOKEN_IF; }
"else"      { return TOKEN_ELSE; }
"while"     { return TOKEN_WHILE; }
"return"    { return TOKEN_RETURN; }
"true"      { return TOKEN_TRUE; }
"false"     { return TOKEN_FALSE; }
"final"     { return TOKEN_FINAL; }
"print"     { return TOKEN_PRINT; }

"+"         { return TOKEN_PLUS; }
"-"         { return TOKEN_MINUS; }
"*"         { return TOKEN_MULTIPLY; }
"/"         { return TOKEN_DIVIDE; }
"%"         { return TOKEN_MOD; }
"=="        { return TOKEN_EQ; }
"!="        { return TOKEN_NEQ; }
"<"         { return TOKEN_LT; }
">"         { return TOKEN_GT; }
"<="        { return TOKEN_LEQ; }
">="        { return TOKEN_GEQ; }
"&&"        { return TOKEN_AND; }
"||"        { return TOKEN_OR; }
"!"         { return TOKEN_NOT; }
"="         { return TOKEN_ASSIGN; }

"("         { return TOKEN_LPAREN; }
")"         { return TOKEN_RPAREN; }
"{"         { return TOKEN_LBRACE; }
"}"         { return TOKEN_RBRACE; }
"["         { return TOKEN_LBRACKET; }
"]"         { return TOKEN_RBRACKET; }
";"         { return TOKEN_SEMICOLON; }
","         { return TOKEN_COMMA; }

{INT_LIT}   { yylval.int_val = atoi(yytext); return TOKEN_INT_LIT; }
{FLOAT_LIT} { yylval.float_val = atof(yytext); return TOKEN_FLOAT_LIT; }
{CHAR_LIT}  { 
    yylval.char_val = process_char_literal(yytext); 
    if (yylval.char_val == '\0') { // Invalid char literal
        yyerror("Invalid character literal");
    }
    return TOKEN_CHAR_LIT; 
}
{STRING_LIT} { 
    yylval.string_val = strdup(yytext); 
    if (!yylval.string_val) {
        yyerror("Memory allocation failed for string");
    }
    return TOKEN_STRING_LIT; 
}
{ID}        { 
    yylval.string_val = strdup(yytext); 
    if (!yylval.string_val) {
        yyerror("Memory allocation failed for identifier");
    }
    return TOKEN_ID; 
}

"//".*      { /* Ignore comments */ }
{WHITESPACE} { /* Ignore whitespace */ }
{NEWLINE}   { yylineno++; }

.           { yyerror("Invalid character"); }

%%

char process_char_literal(const char *text) {
    if (text[0] != '\'' || text[strlen(text) - 1] != '\'') {
        return '\0'; // Invalid char literal
    }
    if (text[1] == '\\') {
        switch (text[2]) {
            case 'n': return '\n';
            case 't': return '\t';
            case '\\': return '\\';
            case '\'': return '\'';
            default: return text[2];
        }
    }
    return text[1];
}

void yyerror(const char *msg) {
    fprintf(stderr, "Error at line %d: %s (near '%s')\n", yylineno, msg, yytext);
}