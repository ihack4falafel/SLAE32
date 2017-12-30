#### GDB Cheatsheet
This is a quick command reference for GDB (GNU Debugger).

load binary into GDB
```php
gdb /path/to/binary
```

run binary inside GDB
```php
(gdb) run
```

place breakpoint at main fucntion
```php
(gdb) break main
```

check registers
```php
(gdb) info registers
```

display content of given register
```php
(gdb) display /x $<register name>
```

disassemble given register
```php
(gdb) disassemble $<register name>
```

disassemble given function
```php
(gdb) disassemble $<function name>
```

check registers including FPU, XMM, and MMX
```php
(gdb) info all-registers
```

check  the layout of process associated with binary running in GDB
```php
(gdb) info proc mappings
```

disassemble using Intel syntax in GDB (default is AT&T)
```php
(gdb) set disassembly-flavor intel
```

step into instruction
```php
(gdb) stepi
```

examine memory for given address and print content as string
```php
(gdb) x/s <memory address>
```

list function in binary such as main
```php
(gdb) info functions
```

execute shell command from gdb
```php
(gdb) shell <command here>
```

list global and static variables in binary
```php
(gdb) info variables
```

examine first byte value of given variable
```php
(gdb) x/xb &<variable name>
```

list source file (usually prints code in and around main function)
```php
(gdb) list
```

list source file and start from given line number
```php
(gdb) list <line number>
```

examine local variables of binary
```php
(gdb) info scope <local variable name>
```

load symbol file in GDB
```php
(gdb) symbol-file <filename>
```
