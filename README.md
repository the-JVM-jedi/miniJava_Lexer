
# MiniJava Lexer

This is a lexer for a simplified Java language (MiniJava) written using Flex.

## Files Included

- `main.c` - The main driver for running the lexer.
- `miniJava.l` - The Flex file containing lexical rules.
- `tokens.h` - Header file defining all token types.
- `lex.yy.c` - Actual lexer file generated from flex.
## Build and Run

```bash
gcc lex.yy.c main.c -o lexer
./lexer <your_mini_java_file.java>
```

## Example

```bash
./lexer example.java
```

This will print the tokens recognized in the file with their types and line numbers.

## License
MIT License
