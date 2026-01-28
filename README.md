# CityUHKThesis LaTeX Template

A LaTeX thesis template for research postgraduate (MPhil and PhD) and professional doctorate (PD) students at City University of Hong Kong (CityUHK).

This template complies with the 2024-25 thesis formatting regulations. Refer to the [Regulations Governing the Format of Theses](sgs_guidebook.pdf) for more details. See [thesis.pdf](thesis.pdf) for a sample PDF created using this template.

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
- **XeLaTeX**: Must be configured as the typesetting engine.
- **Biber**: For bibliography processing.

### Required Fonts
- **Times New Roman**: For English text.
- **PMingLiU/新細明體**: For Traditional Chinese text on the title page.

Ensure these fonts are installed system-wide.

## Quick Start

### Online Usage (Recommended)

CityUHKThesis is available in the Overleaf template gallery: [CityUHKThesis](https://www.overleaf.com/latex/templates/cityuhkthesis/jkjvzshqtmgh).

You can also manually import this template into online LaTeX editors like [Overleaf](https://www.overleaf.com) or [OpenAI Prism](https://prism.openai.com).

To use online editors, select XeLaTeX as the compiler. For Overleaf, refer to this [tutorial](https://www.overleaf.com/learn/how-to/Changing_compiler) if needed.

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

### Offline Usage (Manual Compilation)

If you prefer manual compilation:

```bash
# Full compilation with bibliography
xelatex thesis.tex
biber thesis
xelatex thesis.tex
xelatex thesis.tex
```

## Troubleshooting

### Common Issues

1. **Font not found errors**: Ensure Times New Roman and PMingLiU are installed system-wide.
2. **Bibliography not appearing**: Run the full build process (`make` or manual compilation with biber).
3. **Chinese characters not displaying**: Verify XeLaTeX is being used and fonts are available.

## Development

### Customization
- Modify `CityUHKThesis.cls` for class-level changes.
- Edit chapter files in the `Chapters/` directory.
- Update bibliography in `References/references.bib`.
- Customize front matter in the `FrontMatter/` directory.

### Citation Style
The template uses ACM Reference Format. Citation files are included in the repository.

## Disclaimer

This template is designed to meet CityUHK requirements but is not an official template. Use at your own risk.

## License

[MIT License](LICENSE).
