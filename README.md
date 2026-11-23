# LuaJIT 2.1 Syntax Extension
Adds syntax highlighting for for LuaJIT's 2.1 keywords, operators, and numeric literals on top of VS Code's Lua support.

[Pull Requests]() are welcome.

## Features
- Keywords `const`, `continue`
- Operators `??`, `?.`, ternary (`?`/`:`), `&&`, `||`, `!`, `~`, `&`
- Numeric Literals `0b...`, underscore separators (`1_000_000`, `0xFF_80`, `0b1010_1010`), suffices (`LL`, `ULL`)
- Library `jit` `bit` `debug` (matching `math` behaviour)

## Compatibility
This extension adds regex rules on top of VS Code's existing Lua (`source.lua`) grammar rather than replacing it. Because it uses standard TextMate scopes, it works with existing Lua themes-exact colors depend on your active theme.

Built for the Löve community ♡, though it works across any Lua codebase. 

### Why no lambda highlighting?
`->` already highlights as `-` and `>`, while `|a, b|` pipes aren't operators and don't fit cleanly into VS Code's bracket-pair colorizer-and I'd rather leave them unstyled than color them like operators.

Personal Notes to follow up: https://code.visualstudio.com/api/language-extensions/syntax-highlight-guide#configure-bracket-matching-scopes
