# README



Lab assignments for *Compilers* @ NJU-SE, Spring 2024.



## Structure

```
.
├── Lab.iml
├── Makefile
├── Makefile.git
├── README.md
├── asm				# Object Code Dir
├── ir				# IR Dir
├── src
└── tests			# Test Cases Dir
```

## Usage

*   Compile

    ```bash
    make compile
    ```

*   Run

    ```bash
    make run FILEPATH=<file_path>
    ```

## Feature

|   #   |                             Task                             |   Tool    |
| :---: | :----------------------------------------------------------: | :-------: |
| Lab 1 |                    Lexer & Error Handling                    |  ANTLR4   |
| Lab 2 | $(1)$ Parser & Error Handling<br> $(2)$ **Code Highlighting** *(challenging & fun)*<br> $(3)$ **Code Formatting** *(challenging & fun)* |  ANTLR4   |
| Lab 3 |                          Type Check                          |  ANTLR4   |
| Lab 4 |                          IR Gen (I)                          | LLVM JAVA |
| Lab 5 |                         IR Gen (II)                          | LLVM JAVA |
| Lab 6 | $(1)$ Code Gen<br> $(2)$ **Register Allocation** *(challenging & fun)* |   RARS    |

