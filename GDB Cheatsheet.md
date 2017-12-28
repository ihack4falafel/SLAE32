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
