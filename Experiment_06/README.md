# Experiment 6

**Name:** Samruddhi Kalbande  
**PRN:** 24070521278  

## Aim
Conversion of decimal to hexadecimal number in a file.

## Description
This LEX program reads a file and converts all decimal numbers found in the text to their hexadecimal equivalents. Non-numeric text is passed through unchanged.

## How to Run
```bash
lex exp6.l
cc lex.yy.c -ll
./a.out input.txt
```

### Example
**Input:** `The port number is 8080`  
**Output:** `The port number is 0x1F90`
