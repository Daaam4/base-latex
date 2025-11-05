#!/bin/bash

# Advanced LaTeX Project Compilation Script
# Usage: ./compile-advanced.sh [options]
# Options:
#   -c, --clean    Clean all auxiliary files before compilation
#   -o, --open     Open the PDF after successful compilation
#   -w, --watch    Watch for file changes and recompile automatically
#   -h, --help     Show this help message

set -e  # Exit on any error

MAIN_FILE="000report"
BIB_FILE="bib/quellen.bib"
CLEAN=false
OPEN_PDF=false
WATCH_MODE=false

# Function to show help
show_help() {
    echo "LaTeX Project Compilation Script"
    echo ""
    echo "Usage: $0 [options]"
    echo ""
    echo "Options:"
    echo "  -c, --clean    Clean all auxiliary files before compilation"
    echo "  -o, --open     Open the PDF after successful compilation"
    echo "  -w, --watch    Watch for file changes and recompile automatically"
    echo "  -h, --help     Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0              # Simple compilation"
    echo "  $0 -c           # Clean and compile"
    echo "  $0 -co          # Clean, compile, and open PDF"
    echo "  $0 -w           # Watch mode for continuous compilation"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -c|--clean)
            CLEAN=true
            shift
            ;;
        -o|--open)
            OPEN_PDF=true
            shift
            ;;
        -w|--watch)
            WATCH_MODE=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Function to clean auxiliary files
clean_files() {
    echo "Cleaning auxiliary files..."
    rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lot *.lof *.fdb_latexmk *.fls *.synctex.gz
    rm -f doc/*.aux
    echo "Cleanup completed."
}

# Function to compile LaTeX
compile_latex() {
    echo "Starting LaTeX compilation for ${MAIN_FILE}..."
    
    # Check if main .tex file exists
    if [ ! -f "${MAIN_FILE}.tex" ]; then
        echo "Error: ${MAIN_FILE}.tex not found!"
        return 1
    fi
    
    # Check if bibliography file exists
    if [ ! -f "${BIB_FILE}" ]; then
        echo "Warning: Bibliography file ${BIB_FILE} not found!"
    fi
    
    # First LaTeX run
    echo "First pdflatex run..."
    if ! pdflatex -interaction=nonstopmode "${MAIN_FILE}.tex" > /dev/null 2>&1; then
        echo "Error in first pdflatex run. Check the log file."
        return 1
    fi
    
    # Run BibTeX if bibliography exists
    if [ -f "${BIB_FILE}" ]; then
        echo "Running BibTeX..."
        if ! bibtex "${MAIN_FILE}" > /dev/null 2>&1; then
            echo "Warning: BibTeX encountered issues. Check the .blg file."
        fi
    fi
    
    # Second LaTeX run
    echo "Second pdflatex run..."
    if ! pdflatex -interaction=nonstopmode "${MAIN_FILE}.tex" > /dev/null 2>&1; then
        echo "Error in second pdflatex run. Check the log file."
        return 1
    fi
    
    # Third LaTeX run
    echo "Third pdflatex run..."
    if ! pdflatex -interaction=nonstopmode "${MAIN_FILE}.tex" > /dev/null 2>&1; then
        echo "Error in third pdflatex run. Check the log file."
        return 1
    fi
    
    # Check if PDF was created
    if [ -f "${MAIN_FILE}.pdf" ]; then
        echo "✓ Compilation completed successfully!"
        echo "📄 Output: ${MAIN_FILE}.pdf ($(ls -lh ${MAIN_FILE}.pdf | awk '{print $5}'))"
        return 0
    else
        echo "❌ Error: PDF was not generated!"
        return 1
    fi
}

# Function to open PDF
open_pdf() {
    if [ -f "${MAIN_FILE}.pdf" ]; then
        echo "Opening PDF..."
        open "${MAIN_FILE}.pdf"
    fi
}

# Main execution
if [ "$CLEAN" = true ]; then
    clean_files
fi

if [ "$WATCH_MODE" = true ]; then
    echo "👀 Entering watch mode. Press Ctrl+C to stop."
    echo "Watching for changes in .tex, .bib files..."
    
    # Initial compilation
    compile_latex
    if [ "$OPEN_PDF" = true ]; then
        open_pdf
    fi
    
    # Watch for file changes (requires fswatch - install via: brew install fswatch)
    if command -v fswatch >/dev/null 2>&1; then
        fswatch -o . -e ".*" -i "\.tex$" -i "\.bib$" | while read f; do
            echo ""
            echo "🔄 Files changed, recompiling..."
            if compile_latex; then
                echo "⏰ $(date '+%H:%M:%S') - Recompilation successful"
            else
                echo "⏰ $(date '+%H:%M:%S') - Recompilation failed"
            fi
        done
    else
        echo "❌ fswatch not found. Install it with: brew install fswatch"
        echo "Falling back to manual compilation."
        compile_latex
    fi
else
    # Normal compilation mode
    if compile_latex; then
        if [ "$OPEN_PDF" = true ]; then
            open_pdf
        fi
    else
        exit 1
    fi
fi