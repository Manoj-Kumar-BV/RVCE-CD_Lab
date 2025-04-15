
## For Lex Folder - How to Compile and Run the Lex program files in Lex folder in each Program Folder

1. Generate the C source file from the Lex file:
   ```bash
   lex prog1.l
   ```

2. Compile the generated C file:
   ```bash
   cc lex.yy.c -ll
   ```

3. Run the compiled program:
   ```bash
   ./a.out
   ```
## Files
- `prog1.l` - The Lex source file containing rules and patterns
- `lex.yy.c` - Generated C file from `prog1.l`
- `a.out` - Executable generated after compiling `lex.yy.c`
