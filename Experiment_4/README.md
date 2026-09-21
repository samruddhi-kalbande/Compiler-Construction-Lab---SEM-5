# Experiment 4

**Name:** Samruddhi Kalbande  
**PRN:** 24070521278  

## Aim
Introduction to YACC tool, and format to write YACC code.

## Description
This experiment demonstrates the YACC (Yet Another Compiler Compiler) tool by implementing a simple arithmetic calculator. The YACC file (`exp4.y`) defines the grammar rules for expressions with operator precedence, while the LEX file (`exp4.l`) provides the tokenizer.

### YACC File Structure:
1. **Declarations section** (`%{ ... %}`) — C declarations, token definitions
2. **Rules section** (`%%...%%`) — Grammar rules with actions
3. **User code section** — `main()`, `yyerror()` functions

## How to Run
```bash
yacc -d exp4.y
lex exp4.l
cc y.tab.c lex.yy.c -ly -ll
./a.out
```
Enter arithmetic expressions like `3+5*2` and press Enter to see the result.
