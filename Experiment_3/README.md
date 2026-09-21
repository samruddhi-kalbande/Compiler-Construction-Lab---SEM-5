# Experiment 3

**Name:** Samruddhi Kalbande  
**PRN:** 24070521278  

## Aim
Count number of words starting with "A".

## Description
This LEX program scans the input and counts the number of words that start with the letter 'A' (case-insensitive). It also displays each matching word found.

## How to Run
```bash
lex exp3.l
cc lex.yy.c -ll
./a.out
```
Enter text and press `Ctrl+D` to see results. You can also pass a file:
```bash
./a.out input_file.txt
```
