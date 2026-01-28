# latexmk configuration for Prism
# Use biber for biblatex (backend=biber)
$bibtex = 'biber %O %B';
$bibtex_use = 2;

# Run enough passes automatically
$pdf_mode = 1;
$pdflatex = 'xelatex %O %S';