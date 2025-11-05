#!/bin/bash

# LaTeX Project Compilation Script
# This script compiles the LaTeX project with proper bibliography handling

set -e  # Exit on any error

MAIN_FILE="000report"
BIB_FILE="bib/quellen.bib"

echo "Starting LaTeX compilation for ${MAIN_FILE}..."

# Check if main .tex file exists
if [ ! -f "${MAIN_FILE}.tex" ]; then
    echo "Error: ${MAIN_FILE}.tex not found!"
    exit 1
fi

# Check if bibliography file exists
if [ ! -f "${BIB_FILE}" ]; then
    echo "Warning: Bibliography file ${BIB_FILE} not found!"
fi

# Clean previous compilation artifacts (optional)
echo "Cleaning previous compilation files..."
rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lot *.lof *.fdb_latexmk *.fls *.synctex.gz
rm -f doc/*.aux

# First LaTeX run - generates .aux files
echo "First pdflatex run..."
pdflatex -interaction=nonstopmode "${MAIN_FILE}.tex"

# Check if bibliography exists and run BibTeX
if [ -f "${BIB_FILE}" ]; then
    echo "Running BibTeX..."
    bibtex "${MAIN_FILE}"
fi

# Second LaTeX run - incorporates bibliography
echo "Second pdflatex run..."
pdflatex -interaction=nonstopmode "${MAIN_FILE}.tex"

# Third LaTeX run - fixes cross-references and TOC
echo "Third pdflatex run..."
pdflatex -interaction=nonstopmode "${MAIN_FILE}.tex"

echo "Compilation completed successfully!"
echo "Output file: ${MAIN_FILE}.pdf"

# Check if PDF was created
if [ -f "${MAIN_FILE}.pdf" ]; then
    echo "PDF generated successfully: $(ls -lh ${MAIN_FILE}.pdf | awk '{print $5}')"
else
    echo "Error: PDF was not generated!"
    exit 1
fi