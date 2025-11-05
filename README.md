## One-sided layout for reports or thesis at the FH Aachen
This is a one-sided layout for reports or final thesis at the FH Aachen. It was used for a thesis in the faculty of Medical Engineering and Applied Mathematics in 2019. The structure and requirements should always be checked with the professor and the examination office. 
The structures was adapted from Sven Hinz (https://github.com/SvenHinz). 

Comments in the document describe the functions of the code. 
The code was developed in Overleaf (\url{https://www.overleaf.com)}. Overleaf is an online tool to write and compile your LaTeX document. An account, but no installation is needed. 

It is also possible to install LaTeX on your desktop:

- [Mac](https://tug.org/mactex/ "MacTeX")
- [Windows](http://miktex.org/ "MiKTeX")
- [Ubuntu](https://wiki.ubuntuusers.de/LaTeX/ "Anleitung für Ubuntu")

Additional a LaTeX-Editor is useful:

- [Texmaker](http://www.xm1math.net/texmaker/ "Texmaker") (cross-platform)
- [TeXstudio](http://www.texstudio.org/ "TeXstudio") (cross-platform)
- [TeXnicCenter](http://www.texniccenter.org/ "TeXnicCenter") (Windows only)

## Compilation Scripts

This project includes several ways to compile the LaTeX document:

### 1. Simple Shell Script
Use the basic compilation script:
```bash
./compile.sh
```

### 2. Advanced Shell Script
The advanced script provides additional options:
```bash
./compile-advanced.sh [options]
```

Options:
- `-c, --clean`: Clean auxiliary files before compilation
- `-o, --open`: Open PDF after successful compilation
- `-w, --watch`: Watch for file changes and recompile automatically
- `-h, --help`: Show help message

Examples:
```bash
./compile-advanced.sh              # Simple compilation
./compile-advanced.sh -c           # Clean and compile
./compile-advanced.sh -co          # Clean, compile, and open PDF
./compile-advanced.sh -w           # Watch mode (requires fswatch)
```

### 3. Makefile
Use make commands for compilation:
```bash
make          # Compile the project
make clean    # Remove auxiliary files
make rebuild  # Clean and compile
make open     # Open the generated PDF
make watch    # Watch for changes (requires fswatch)
make help     # Show available targets
```

### Requirements
- LaTeX distribution (TeXLive, MacTeX, MiKTeX)
- For watch mode: `fswatch` (install via `brew install fswatch` on macOS)

### Project Structure
- `000report.tex` - Main LaTeX document
- `bib/quellen.bib` - Bibliography database
- `doc/` - Document chapters and sections
- `pic/` - Images and figures
- `unsrtdineng.bst` - Custom bibliography style
