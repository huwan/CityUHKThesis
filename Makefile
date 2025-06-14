# CityUHKThesis Makefile
# Optimized compilation for XeLaTeX + Biber

# Configuration
MAIN = thesis
TEXENGINE = xelatex
BIBENGINE = biber
MAKEINDEX = makeindex

# Directories
BUILDDIR = .texpadtmp
OUTPUTDIR = output

# Files
MAINTEX = $(MAIN).tex
MAINPDF = $(MAIN).pdf
AUXFILES = *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.out *.run.xml *.synctex.gz *.toc *.lof *.lot

# Default target
all: $(MAINPDF)

# Full build with bibliography
$(MAINPDF): $(MAINTEX) References/references.bib
	@echo "=== Building thesis with bibliography ==="
	@mkdir -p $(BUILDDIR)
	@find . -name "*.tex" -type f -exec dirname {} \; | sort -u | while read dir; do \
		if [ "$$dir" != "." ]; then \
			mkdir -p "$(BUILDDIR)/$$dir"; \
		fi; \
	done
	$(TEXENGINE) -output-directory=$(BUILDDIR) $(MAINTEX)
	$(BIBENGINE) $(BUILDDIR)/$(MAIN)
	$(TEXENGINE) -output-directory=$(BUILDDIR) $(MAINTEX)
	$(TEXENGINE) -output-directory=$(BUILDDIR) $(MAINTEX)
	@cp $(BUILDDIR)/$(MAINPDF) .
	@echo "=== Build complete: $(MAINPDF) ==="

# Quick build (no bibliography update)
quick:
	@echo "=== Quick build (no bibliography) ==="
	@mkdir -p $(BUILDDIR)
	@find . -name "*.tex" -type f -exec dirname {} \; | sort -u | while read dir; do \
		if [ "$$dir" != "." ]; then \
			mkdir -p "$(BUILDDIR)/$$dir"; \
		fi; \
	done
	$(TEXENGINE) -output-directory=$(BUILDDIR) $(MAINTEX)
	@cp $(BUILDDIR)/$(MAINPDF) .

# Draft build (fast, low quality)
draft:
	@echo "=== Draft build ==="
	@mkdir -p $(BUILDDIR)
	@find . -name "*.tex" -type f -exec dirname {} \; | sort -u | while read dir; do \
		if [ "$$dir" != "." ]; then \
			mkdir -p "$(BUILDDIR)/$$dir"; \
		fi; \
	done
	$(TEXENGINE) -output-directory=$(BUILDDIR) -draftmode $(MAINTEX)
	$(TEXENGINE) -output-directory=$(BUILDDIR) $(MAINTEX)
	@cp $(BUILDDIR)/$(MAINPDF) .

# Clean auxiliary files
clean:
	@echo "=== Cleaning auxiliary files ==="
	@rm -f $(AUXFILES)
	@rm -rf $(BUILDDIR)
	@echo "=== Clean complete ==="

# Deep clean (including PDFs)
distclean: clean
	@echo "=== Deep cleaning ==="
	@rm -f $(MAINPDF)
	@rm -rf $(OUTPUTDIR)

# Create output directory and copy final PDF
release: $(MAINPDF)
	@echo "=== Creating release ==="
	@mkdir -p $(OUTPUTDIR)
	@cp $(MAINPDF) $(OUTPUTDIR)/$(MAIN)-$(shell date +%Y%m%d).pdf
	@echo "=== Release created in $(OUTPUTDIR) ==="

# Help
help:
	@echo "CityU PhD Thesis Build System"
	@echo ""
	@echo "Targets:"
	@echo "  all        - Full build with bibliography (default)"
	@echo "  quick      - Quick build without bibliography update"
	@echo "  draft      - Fast draft build"
	@echo "  clean      - Remove auxiliary files"
	@echo "  distclean  - Remove all generated files"
	@echo "  release    - Create dated release PDF"
	@echo "  help       - Show this help"

.PHONY: all quick draft clean distclean release help 