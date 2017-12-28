#### GDB Cheatsheet
This is a quick command reference for GDB (GNU Debugger).

Load binary into GDB
```
gdb /path/to/binary
```
Run binary inside GDB
```
(gdb) run
```
Place breakpoint at main fucntion
```
(gdb) break main
```

Check registers
```
(gdb) info registers
```

Display content of given register
```
(gdb) display /x $<register name>
```

Disassemble given register
```
(gdb) disassemble $<register name>
```

Disassemble given function
```
(gdb) disassemble $<function name>
```

Check registers including FPU, XMM, and MMX
```
(gdb) info all-registers
```

Disassemble in Intel syntax in GDB (default is AT&T)
```
(gdb) set disassembly-flavor intel
```
