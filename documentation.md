
# MiniJava Lexer using Flex

## Overview
This project implements a lexical analyzer (lexer) for a simplified version of the Java programming language ("MiniJava") using **Flex** (Fast Lexical Analyzer Generator). The lexer is designed to tokenize source code according to MiniJava's lexical grammar.

## Language Definition

### Identifiers
- Must start with a letter (`a-z`, `A-Z`) or underscore (`_`).
- May contain letters, digits (`0-9`), and underscores after the first character.
- Are **case-sensitive**.
- Examples: `x`, `myVar`, `_temp`, `count1`.

### Keywords
- Reserved words in MiniJava include:
  - `class`, `public`, `static`, `void`, `int`, `char`, `boolean`
  - `if`, `else`, `while`, `return`
  - Boolean literals: `true`, `false`
  - Special: `final`, `print` (optional features)
- Keywords are recognized and tokenized specially.

### Literals
- **Integer literals**: Whole numbers, e.g., `123`, `0`
- **Character literals**: Single characters enclosed in single quotes, e.g., `'a'`, `'\n'`
- **String literals**: Sequences of characters in double quotes, e.g., `"hello"`
- **Boolean literals**: `true`, `false`
- **Floating-point literals** (e.g., `3.14`, `0.5`) are defined but reserved for later implementation.

### Operators
- **Arithmetic**: `+`, `-`, `*`, `/`, `%`
- **Relational**: `==`, `!=`, `<`, `>`, `<=`, `>=`
- **Logical**: `&&`, `||`, `!`
- **Assignment**: `=`
- **Unary**: `-` (negation), `!` (logical NOT)

### Comments
- **Single-line comments**: Begin with `//` and extend to the end of the line.

### Whitespace
- Spaces, tabs, and newlines are ignored (except as token delimiters).

---

## Project Components

### 1. `miniJava.l`
Defines the lexical rules using Flex syntax. Each rule matches a regular expression and returns an appropriate token.

### 2. `tokens.h`
Defines token types using an `enum`, and a union (`YYSTYPE`) to store token values such as integers, floats, characters, and strings.

### 3. `main.c`
The main driver program for the lexer. Reads source code files, runs the lexer, and prints out recognized tokens with line numbers and lexemes.

## How to Use

### Step 1: Generate the scanner
```bash
flex miniJava.l
```

### Step 2: Compile the generated code
```bash
gcc lex.yy.c main.c -o lexer
```

### Step 3: Run the lexer
```bash
./lexer yourFile.java
```

### Example Output
```
Line 1: Token CLASS (class)
Line 1: Token ID (Main)
Line 1: Token LBRACE ({)
...
```

## Requirements
- GCC
- Flex

## Notes
- `float` literals are not yet implemented, but may be added in the future.
