#!/bin/bash
# Script para convertir informe.md a PDF usando pandoc + pdflatex
# Requiere: pandoc, pdflatex (texlive-latex-base)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INPUT="${SCRIPT_DIR}/informe.md"
OUTPUT="${SCRIPT_DIR}/informe.pdf"

# Opciones de pandoc:
#   -f markdown+tex_math_dollars  : interpreta $...$ como math LaTeX
#   --pdf-engine=pdflatex         : motor LaTeX
#   -V geometry:margin=1in        : márgenes de 1 pulgada
#   --highlight-style=tango       : estilo de código (aunque no hay código)
#   --metadata title=...          : título del PDF

pandoc "$INPUT" \
    -o "$OUTPUT" \
    -f markdown+tex_math_dollars \
    --pdf-engine=pdflatex \
    -V geometry:margin=1in \
    -V geometry:headheight=2cm \
    -V geometry:headsep=1cm \
    --metadata title="Trabajo Especial - Modelos y Simulación" \
    --metadata author="E. Pereyra, J. Carrillo"

echo "PDF generado: ${OUTPUT}"
