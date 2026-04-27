# CMSC 313 Project 2

## Description

This program implements an assembly language program that 
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
│   └── ehhh tbd might delete
├── README.md
└── .gitignore # build and executable files are ignored
```

## How to Run

From the root of the repository, run:

```bash
mkdir -p build
as -o build/double.o src/double.s
ld -o build/double build/double.o
./build/double
```
