# Compiler Construction Lab — SEM 5

**Name:** Samruddhi Kalbande  
**PRN:** 24070521278  
**Subject:** Compiler Construction Lab  
**Semester:** 5  

---

## Experiment List

| Exp No. | CO  | Aim |
|---------|-----|-----|
| 1 | CO1 | Introduction to LEX tool, metadata and patterns |
| 2 | CO1 | Count the number of comments, keywords, identifiers, words, lines and spaces from input file |
| 3 | CO1 | Count number of words starting with "A" |
| 4 | CO2 | Introduction to YACC tool, and format to write YACC code |
| 5 | CO2 | Conversion of lowercase to uppercase and vice versa |
| 6 | CO2 | Conversion of decimal to hexadecimal number in a file |
| 7 | CO3 | Test lines ending with "COM" |

---

## How to Compile & Run

### LEX Programs
```bash
lex filename.l
cc lex.yy.c -ll
./a.out
```

### YACC Programs
```bash
yacc -d filename.y
lex filename.l
cc y.tab.c lex.yy.c -ly -ll
./a.out
```
