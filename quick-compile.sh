#!/bin/bash

# LaTeX Project Quick Compilation Script
# Optimized for robustness and error handling

MAIN_FILE="000report"
BIB_FILE="bib/quellen.bib"

echo "🚀 Starting LaTeX compilation for ${MAIN_FILE}..."

# Check if main .tex file exists
if [ ! -f "${MAIN_FILE}.tex" ]; then
    echo "❌ Error: ${MAIN_FILE}.tex not found!"
    exit 1
fi

# Function to run pdflatex with better error handling
run_pdflatex() {
    local run_number=$1
    echo "📝 Running pdflatex (run $run_number)..."
    
    # Run pdflatex and capture output, but don't exit on error due to UTF-8 warnings
    pdflatex -interaction=nonstopmode "${MAIN_FILE}.tex"
    local exit_code=$?
    
    if [ $exit_code -eq 0 ]; then
        echo "✅ pdflatex run $run_number completed successfully"
    else
        echo "⚠️  pdflatex run $run_number completed with exit code $exit_code (may be normal for UTF-8 warnings)"
    fi
}

# Clean old auxiliary files
echo "🧹 Cleaning previous compilation files..."
rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lot *.lof *.fdb_latexmk *.fls *.synctex.gz
rm -f doc/*.aux

# First LaTeX run
run_pdflatex 1

# Run BibTeX if bibliography exists
if [ -f "${BIB_FILE}" ]; then
    echo "📚 Running BibTeX..."
    if bibtex "${MAIN_FILE}" > /dev/null 2>&1; then
        echo "✅ BibTeX completed successfully"
    else
        echo "⚠️  BibTeX completed with warnings (checking bibliography for encoding issues)"
    fi
fi

# Second LaTeX run
run_pdflatex 2

# Third LaTeX run
run_pdflatex 3

# Check if PDF was created
if [ -f "${MAIN_FILE}.pdf" ]; then
    file_size=$(ls -lh "${MAIN_FILE}.pdf" | awk '{print $5}')
    echo ""
    echo "🎉 Compilation completed!"
    echo "📄 Generated: ${MAIN_FILE}.pdf (${file_size})"
    echo ""
    echo "💡 Note: If you see UTF-8 encoding warnings, consider checking the bibliography file"
    echo "   for special characters that may need proper LaTeX encoding."
else
    echo "❌ Error: PDF was not generated!"
    echo "Check the .log file for detailed error information."
    exit 1
fi