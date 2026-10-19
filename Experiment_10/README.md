# Experiment 10

**Name:** Samruddhi Kalbande

**PRN:** 24070521278

## Aim
Build a YACC parser for `FOR` loop statements.

## Description
The parser checks a C-style `for` loop with optional initialization,
condition, and update expressions. The body may be a single expression
statement, another loop, an empty statement, or a brace-delimited block.
Expressions support assignments, arithmetic, comparisons, logical operators,
and prefix/postfix increment and decrement. The parser validates syntax; it
does not execute the loop.

## How to Run
```bash
yacc -d exp10.y
lex exp10.l
cc y.tab.c lex.yy.c -ly -ll -o exp10
./exp10
```

### Example
```c
for (i = 0; i < 10; i++) {
    sum = sum + i;
}
```

Valid input prints `Valid FOR-loop syntax.` Syntax errors include the current
input line number.
