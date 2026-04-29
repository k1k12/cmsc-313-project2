# CMSC 313 Project 2

## Description

Implements an assembly language program that 
reads from the command line a number, doubles that number, 
and then prints out "The double is: " and the doubled number.

## Repository Structure

```text
cmsc-313-project2/
├── src/
│   └── double.s
├── build/
│   └── double.o
│   └── double
├── docs/
│   └── testing.md
├── README.md
└── .gitignore
```

## How to Run

From the root of the repository run:

```bash
as -o build/double.o src/double.s
ld -o build/double build/double.o
./build/double
```
