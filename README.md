# Personal Neovim Config

## C/C++ development

This config uses `clangd` (installed through Mason) for C and C++ LSP features.

Automatic include/library detection works best when your project provides one of:

- `compile_commands.json` (recommended)
- `compile_flags.txt`
- `.clangd`

`clangd` is configured with `--query-driver` for common macOS compiler paths, so it can infer standard library and toolchain include paths automatically.

For CMake projects, enable compile commands with:

```bash
cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```

If needed, symlink it into the project root:

```bash
ln -sf build/compile_commands.json compile_commands.json
```
