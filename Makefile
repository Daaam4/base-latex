# Makefile for LaTeX Project
# Usage:
#   make          - Compile the project
#   make clean    - Remove auxiliary files
#   make rebuild  - Clean and compile
#   make open     - Open the generated PDF
#   make watch    - Watch for changes and recompile

MAIN_FILE = 000report
BIB_FILE = bib/quellen.bib
PDF_VIEWER = open

# Default target
all: $(MAIN_FILE).pdf

# Compile the LaTeX document
$(MAIN_FILE).pdf: $(MAIN_FILE).tex $(BIB_FILE) doc/*.tex
	@echo "Compiling LaTeX document..."
	pdflatex -interaction=nonstopmode $(MAIN_FILE).tex
	@if [ -f $(BIB_FILE) ]; then \
		echo "Running BibTeX..."; \
		bibtex $(MAIN_FILE); \
	fi
	pdflatex -interaction=nonstopmode $(MAIN_FILE).tex
	pdflatex -interaction=nonstopmode $(MAIN_FILE).tex
	@echo "Compilation completed: $(MAIN_FILE).pdf"

# Clean auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lot *.lof *.fdb_latexmk *.fls *.synctex.gz
	rm -f doc/*.aux
	@echo "Cleanup completed."

# Clean and rebuild
rebuild: clean all

# Open the generated PDF
open: $(MAIN_FILE).pdf
	$(PDF_VIEWER) $(MAIN_FILE).pdf

# Watch for changes (requires fswatch)
watch:
	@if command -v fswatch >/dev/null 2>&1; then \
		echo "Watching for file changes. Press Ctrl+C to stop."; \
		fswatch -o . -e ".*" -i "\.tex$$" -i "\.bib$$" | while read f; do \
			echo "Files changed, recompiling..."; \
			$(MAKE) --no-print-directory; \
		done; \
	else \
		echo "fswatch not found. Install it with: brew install fswatch"; \
	fi

# Force rebuild regardless of timestamps
force:
	pdflatex -interaction=nonstopmode $(MAIN_FILE).tex
	@if [ -f $(BIB_FILE) ]; then \
		bibtex $(MAIN_FILE); \
	fi
	pdflatex -interaction=nonstopmode $(MAIN_FILE).tex
	pdflatex -interaction=nonstopmode $(MAIN_FILE).tex

# Show help
help:
	@echo "Available targets:"
	@echo "  all (default) - Compile the LaTeX document"
	@echo "  clean         - Remove auxiliary files"
	@echo "  rebuild       - Clean and compile"
	@echo "  open          - Open the generated PDF"
	@echo "  watch         - Watch for changes and recompile"
	@echo "  force         - Force recompilation"
	@echo "  help          - Show this help message"

# Declare phony targets
.PHONY: all clean rebuild open watch force help

# Suppress default suffix rules
.SUFFIXES: