#!/bin/bash

# Test script for LaTeX setup
echo "Testing LaTeX installation..."

# Update PATH for LaTeX
eval "$(/usr/libexec/path_helper)"

# Check if pdflatex is available
if command -v pdflatex &> /dev/null; then
    echo "✓ pdflatex found"
    
    # Try to compile the document
    echo "Compiling 000report.tex..."
    pdflatex -interaction=nonstopmode 000report.tex
    
    # Check if bibliography needs to be compiled
    if [ -f "000report.aux" ]; then
        echo "Running bibtex..."
        bibtex 000report
        
        # Compile again to resolve references
        echo "Final compilation..."
        pdflatex -interaction=nonstopmode 000report.tex
        pdflatex -interaction=nonstopmode 000report.tex
    fi
    
    if [ -f "000report.pdf" ]; then
        echo "✓ Successfully generated 000report.pdf"
    else
        echo "✗ Failed to generate PDF"
    fi
else
    echo "✗ pdflatex not found. Please restart your terminal or run:"
    echo "  eval \"\$(/usr/libexec/path_helper)\""
fi