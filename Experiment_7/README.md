# Experiment 7

**Name:** Samruddhi Kalbande  
**PRN:** 24070521278  

## Aim
Test lines ending with "COM".

## Description
This LEX program reads input line-by-line and identifies lines that end with the string "COM". It prints each matching line and provides a summary of total lines and lines ending with "COM".

## How to Run
```bash
lex exp7.l
cc lex.yy.c -ll
./a.out
```
Enter lines of text and press `Ctrl+D` to see results.

### Example Input
```
hello world COM
this is a test
example.COM
goodbye
```

### Expected Output
```
Line 1 (ends with COM): hello world COM
Line 3 (ends with COM): example.COM

--- Results ---
Total lines              : 4
Lines ending with 'COM'  : 2
```
