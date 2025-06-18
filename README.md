# CityUHKThesis LaTeX Template

A LaTeX thesis template for research postgraduate (MPhil and PhD) and professional doctorate (PD) students at City University of Hong Kong (CityUHK).

This template complies with the 2024-25 regulations for thesis formatting. Please refer to the Regulations Governing the Format of Theses and Sample Front Cover/Spine/Title Page ([Appendixes 23 and 24 of the Guidebook for Research Degree Studies](sgs_guidebook.pdf)). See [thesis.pdf](thesis.pdf) for a sample PDF created using this template.

## Project Structure

```
├── thesis.tex              # Main LaTeX file
├── CityUHKThesis.cls       # Custom thesis class
├── Makefile                # Build automation
├── Chapters/               # Thesis chapters
│   ├── introduction.tex
│   ├── background.tex
│   ├── paperone/
│   ├── papertwo/
│   ├── paperthree/
│   ├── relatedwork.tex
│   ├── conclusion.tex
│   └── publications.tex
├── FrontMatter/            # Title page, abstract, etc.
├── References/             # Bibliography files
└── ACM-Reference-Format.*  # ACM citation style files
```

## Prerequisites

### Required Software
- **XeLaTeX**: Must be configured as the typesetting engine
- **Biber**: For bibliography processing
- **Make**: For using the automated build system (optional but recommended)

### Required Fonts
- **Times New Roman**: For English text
- **MingLiU/細明體** or **PMingLiU/新細明體**: For Traditional Chinese text on the title page

These fonts should be installed system-wide. Note that (P)MingLiu is not available on online LaTeX editors like Overleaf. For online use, the font file `PMingLiU.ttf` is included in this repository.

## Quick Start

### Using the Makefile (Recommended)

The included Makefile provides several convenient build targets:

```bash
# Full build with bibliography (recommended for final version)
make

# Quick build without bibliography update (faster for drafts)
make quick

# Draft mode (fastest, for quick previews)
make draft

# Clean auxiliary files
make clean

# Remove all generated files including PDFs
make distclean

# Create a dated release PDF
make release

# Show all available targets
make help
```

### Manual Compilation

If you prefer manual compilation or don't have Make available:

```bash
# Full compilation with bibliography
xelatex thesis.tex
biber thesis
xelatex thesis.tex
xelatex thesis.tex
```

### Online Usage (Overleaf)

CityUHKThesis is available in the Overleaf Gallery: [CityUHKThesis](https://www.overleaf.com/latex/templates/cityuhkthesis/jkjvzshqtmgh)

When using online editors:
1. Ensure XeLaTeX is selected as the compiler
2. The PMingLiU.ttf font file is included for Chinese characters

### Document Configuration

Edit the metadata section in `thesis.tex`:

```latex
\title{Your Thesis Title}
\titlezh{你的論文標題}
\author{Your Name}
\authorzh{你的姓名}
\dept{Your Department}
\deptzh{你的學系}
% ... other metadata
```

## Troubleshooting

### Common Issues

1. **Font not found errors**: Ensure Times New Roman and PMingLiU are installed system-wide
2. **Bibliography not appearing**: Run the full build process (`make` or manual compilation with biber)
3. **Chinese characters not displaying**: Verify XeLaTeX is being used and fonts are available

### Build Directory

The Makefile uses `.texpadtmp/` as a build directory to keep auxiliary files organized. The final PDF is copied to the root directory.

## Development

### Customization
- Modify `CityUHKThesis.cls` for class-level changes
- Edit chapter files in `Chapters/` directory
- Update bibliography in `References/references.bib`
- Customize front matter in `FrontMatter/` directory

### Citation Style
The template uses ACM Reference Format. Citation files are included in the repository.

## Disclaimer

Although this template is built to satisfy the requirements of CityUHK, it is not an official template. Use this template at your own risk.

## License

[MIT License](LICENSE).
