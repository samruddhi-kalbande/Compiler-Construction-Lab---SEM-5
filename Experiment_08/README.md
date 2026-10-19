# Experiment 8

**Name:** Samruddhi Kalbande

**PRN:** 24070521278

## Aim
Evaluate postfix arithmetic expressions using YACC and LEX.

## Description
The YACC grammar evaluates binary postfix expressions containing numbers and
the `+`, `-`, `*`, and `/` operators. Enter one expression per line, with
whitespace between operands and operators. Division by zero and malformed
lines are reported without stopping the calculator.

## How to Run
```bash
yacc -d exp8.y
lex exp8.l
cc y.tab.c lex.yy.c -ly -ll -o exp8
./exp8
```

### Example
```text
3 4 + 2 *
```

Output:
```text
Result = 14
```
