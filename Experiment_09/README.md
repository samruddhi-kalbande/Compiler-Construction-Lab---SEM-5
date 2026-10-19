# Experiment 9

**Name:** Samruddhi Kalbande

**PRN:** 24070521278

## Aim
Implement a desk calculator with syntax error recovery.

## Description
The calculator evaluates arithmetic expressions with parentheses, unary
minus, and standard operator precedence. It reports malformed expressions or
division by zero, skips the remainder of the affected input line, and
continues with the next line.

## How to Run
```bash
yacc -d exp9.y
lex exp9.l
cc y.tab.c lex.yy.c -ly -ll -o exp9
./exp9
```

### Example
```text
3 + 5 * 2
(8 - 2) / 3
4 + * 2
7 / 2
```

The valid lines print `13`, `2`, and `3.5`. The malformed third line reports
an error and does not prevent evaluation of the following line.
