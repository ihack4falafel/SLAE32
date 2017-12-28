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

Check  the layout of process associated with binary running in GDB
```
(gdb) info proc mappings
```

Disassemble using Intel syntax in GDB (default is AT&T)
```
(gdb) set disassembly-flavor intel
```
