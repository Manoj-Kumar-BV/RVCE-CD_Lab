# Compiler Design Lab

## Lab Programs

The following are the lab exercises for Compiler Design, implemented using LEX, YACC, and C:

### Program-1    [Link](https://github.com/Manoj-Kumar-BV/RVCE-CD_Lab/tree/main/Program-1)
a) Write a LEX program to count number of words, lines, characters and whitespaces in a given paragraph.  
b) Write a YACC program to recognize strings of the form a<sup>n</sup>b<sup>n+m</sup>c<sup>m</sup>, n, m ≥ 0.

### Program-2    [Link](https://github.com/Manoj-Kumar-BV/RVCE-CD_Lab/tree/main/Program-2)
a) Write a LEX program to count number of Positive and Negative integers and Positive & Negative fractions.  
b) Write a YACC program to validate and evaluate a simple expression involving operators +, -, * and /.

### Program-3    [Link](https://github.com/Manoj-Kumar-BV/RVCE-CD_Lab/tree/main/Program-3)
a) Write a LEX program to count the number of comment lines in a C Program. Also eliminate them and copy that program into a separate file.  
b) Write a YACC program to recognize a nested (minimum 3 levels) FOR loop statement for C language.

### Program-4    [Link](https://github.com/Manoj-Kumar-BV/RVCE-CD_Lab/tree/main/Program-4)
a) Write a LEX program to recognize and count the number of identifiers, operators and keywords in a given input file.  
b) Write a YACC program to recognize nested IF control statements (C language) and display the number of levels of nesting.

### Program-5    [Link](https://github.com/Manoj-Kumar-BV/RVCE-CD_Lab/blob/main/Program-5/code.c)
Write a C program to implement a Shift Reduce parser for a given grammar and generate the parsing table by parsing the given string.

### Program-6    [Link](https://github.com/Manoj-Kumar-BV/RVCE-CD_Lab/tree/main/Program-6)
Write a YACC program that reads the C statements for an input file and convert them in quadruple three address intermediate code.

### Program-7    [Link](https://github.com/Manoj-Kumar-BV/RVCE-CD_Lab/tree/main/Program-7)
Write a YACC program that identifies Function Definition of C language.

### Program-8    [Link](https://github.com/Manoj-Kumar-BV/RVCE-CD_Lab/tree/main/Program-8)
Write a YACC program that generates Assembly language (Target) Code for valid Arithmetic Expression.

### Program-9    [Link](https://github.com/Manoj-Kumar-BV/RVCE-CD_Lab/tree/main/Program-9)
Write a YACC program to recognize declaration statements (C language) and display the number of variables declared.

---

## For Lex Programs - How to Compile and Run the Lex programs

1. Generate the C source file from the Lex file:
    ```bash
    lex filename.l
    gcc lex.yy.c 
    ./a.out
    ```

## For yacc Programs - How to Compile and Run the yacc Programs
```bash
lex filename.l
yacc -d filename.y
gcc lex.yy.c y.tab.c -lfl
./a.out
```
