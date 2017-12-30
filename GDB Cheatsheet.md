#### GDB Cheatsheet
This is a quick command reference for GDB (GNU Debugger).

load binary into GDB
```
gdb /path/to/binary
```

run binary inside GDB
```
(gdb) run
```

place breakpoint at main fucntion
```
(gdb) break main
```

check registers
```
(gdb) info registers
```

display content of given register
```
(gdb) display /x $<register name>
```

disassemble given register
```
(gdb) disassemble $<register name>
```

disassemble given function
```
(gdb) disassemble $<function name>
```

check registers including FPU, XMM, and MMX
```
(gdb) info all-registers
```

check  the layout of process associated with binary running in GDB
```
(gdb) info proc mappings
```

disassemble using Intel syntax in GDB (default is AT&T)
```
(gdb) set disassembly-flavor intel
```

step into instruction
```
(gdb) stepi
```

examine memory for given address and print content as string
```
(gdb) x/s <memory address>
```

list function in binary such as main
```
(gdb) info functions
```

execute shell command from gdb
```
(gdb) shell <command here>
```

list global and static variables in binary
```
(gdb) info variables
```

examine first byte value of given variable
```
(gdb) x/xb &<variable name>
```

list source file (usually prints code in and around main function)
```
(gdb) list
```

list source file and start from given line number
```
(gdb) list <line number>
```

examine local variables of binary
```
(gdb) info scope <local variable name>
```

load symbol file in GDB
```
(gdb) symbol-file <filename>
```
