#### GDB Cheatsheet
This is a quick command reference for GDB (GNU Debugger).

load binary into GDB
```php
gdb /path/to/binary
```

run binary inside GDB
```php
(gdb) run <binary required arguments>
```

place breakpoint at main fucntion
```php
(gdb) break main
```

check registers
```php
(gdb) info registers
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

examine local variables of given function
```php
(gdb) info scope <function name>
```

load symbol file in GDB
```php
(gdb) symbol-file <filename>
```

list binary info and loaded sections
```php
(gdb) info files
```

list breakpoints
```php
(gdb) info breakpoints
```

disable breakpoint 
```php
(gdb) disable <breakpoint number>
```

enable breakpoint 
```php
(gdb) enable <breakpoint number>
```

delete breakpoint 
```php
(gdb) delete <breakpoint number>
```

examine memory for given address
```php
(gdb) x/<repeat count, format, size> <address>
```

examine memory for given variable (used register for this example)
```php
(gdb) x/<repeat count, format, size> $<register name>
```

continue execution after hitting breakpoint
```php
(gdb) continue
```

change data at runtime
```php
(gdb) set {<data type>} <address> = <value>
```

change register at runtime
```php
(gdb) set $<register name> = <value>
```

change variable at runtime
```php
(gdb) set <variable name> = <value>
```

get address of given function
```php
(gdb) print <function name>
```

invoke function at runtime
```php
(gdb) call <function name($args)>
```

set breakpoint at given address
```php
(gdb) break *<address>
```

set conditional breakpoint that only applies when certian pre-set condition is met
```php
(gdb) condition <breakpoint number> <variable> == <value>
```
