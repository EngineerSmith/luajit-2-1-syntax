# LuaJIT 2.1 Syntax Extension
Adds syntax highlighting for for LuaJIT's 2.1 keywords, operators, and numeric literals on top of VS Code's Lua support.

[Issues & Pull Requests are welcome in the github repo](https://github.com/EngineerSmith/luajit-2-1-syntax).

## Features
- Keywords `const`, `continue`
- Operators `??`, `?.`, ternary (`?`/`:`), `&&`, `||`, `!`, `~`, `&`
- Numeric Literals `0b...`, underscore separators (`1_000_000`, `0xFF_80`, `0b1010_1010`), suffices (`LL`, `ULL`)
- Library `jit` `bit` `debug` (matching `math` behaviour)

## Compatibility
This extension adds regex rules on top of VS Code's existing Lua (`source.lua`) grammar rather than replacing it. Because it uses standard TextMate scopes, it works with existing Lua themes (exact color depends on your active theme).

Built for the Löve community ♡, though it works across any Lua codebase. 

### Why no lambda highlighting?
`->` already highlights as `-` and `>`, while `|a, b|` pipes are left unstyled rather than colored as operators (as they aren't operators and bracket matching scope behaviour isn't configured for them yet).
