# Testing

### Test 1: Input 0

Command:

```bash
echo "0" | ./build/double
```

Output:

```text
The double is: 0
```

Result: Pass

---

### Test 2: Input 1

Command:

```bash
echo "1" | ./build/double
```

Output:

```text
The double is: 2
```

Result: Pass

---

### Test 3: Input 42

Command:

```bash
echo "42" | ./build/double
```

Output:

```text
The double is: 84
```

Result: Pass

---

### Test 4: Input 67676767

Command:

```bash
echo "67676767" | ./build/double
```

Output:

```text
The double is: 135353534
```

Result: Pass

---

### Test 5: Very Large Input

Command:

```bash
echo "100000000000000000000" | ./build/double
```

Output:

```text
The double is: 15532559262904483840
```

Expected mathematical result:

```text
200000000000000000000
```

Result: Fail because rax is only 64 bits

### Test 6: Negative Input

Command:

```bash
echo "-1" | ./build/double
```

Output:

```text
The double is: 15532559262904483840
```

Expected mathematical result:

```text
-2
```

Result: Fail because program assumes int is a digit from 0 to 9



## Summary

The program correctly doubles expected positive integer inputs (0-9) that fit within a 64 bit register.

