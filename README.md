# CV

A professional _Curriculum Vitae_ template written in LaTeX. Includes a VS Code dev container for seamless development and automated PDF generation through GitHub Actions. Compiled PDFs are automatically published to the [Releases Page](../../releases) when you push a git tag.

## Features

- **Professional LaTeX template** with custom styling and formatting commands
- **Dev container support** for consistent, zero-config development environment
- **Automated releases** via GitHub Actions — push a tag, get a published PDF
- **Custom `\jobentry` command** for consistent, professional job formatting
- **Pre-configured VS Code extensions** for LaTeX editing, spell-checking, and Git
- **No local setup required** when using dev containers — Docker handles everything

## Prerequisites

### Option A: Dev Container (Recommended)
- [Docker](https://www.docker.com/get-started) installed and running
- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) for VS Code

### Option B: Local Setup
- TeX Live distribution with the following packages:
  - `texlive-latex-base`
  - `texlive-latex-recommended`
  - `texlive-fonts-recommended`
  - `latexmk`
  - `pdflatex`

## Get Started

### Quick Start with Dev Container (Recommended)

1. **Clone and open the repository**
   ```bash
   git clone <your-repo-url>
   cd cv
   code .
   ```

2. **Reopen in Container**
   - VS Code will detect the dev container configuration and prompt you
   - Click "Reopen in Container" (or Command Palette → "Dev Containers: Reopen in Container")
   - Wait for the container to build (first time only; all LaTeX dependencies are included)

3. **Edit your CV**
   - Open [cv_latex.tex](cv_latex.tex)
   - Modify the content between `\begin{resume}` and `\end{resume}`
   - Save your changes (auto-compilation is enabled by default)

4. **View your PDF**
   - The compiled `cv_latex.pdf` is automatically generated on save
   - Click "View PDF" in the LaTeX Workshop panel or right-click → "View LaTeX PDF"

### Alternative: Local Setup

1. **Install TeX Live**
   - **Ubuntu/Debian**:
     ```bash
     sudo apt-get install texlive-latex-base texlive-latex-recommended texlive-fonts-recommended latexmk
     ```
   - **macOS**: `brew install --cask mactex` or [tug.org/mactex](https://tug.org/mactex/)
   - **Windows**: [tug.org/texlive](https://tug.org/texlive/)

2. **Clone, compile, and view**
   ```bash
   git clone <your-repo-url>
   cd cv
   pdflatex -interaction=nonstopmode -halt-on-error -output-directory=. cv_latex.tex
   # Open cv_latex.pdf with your PDF viewer
   ```

## Building Your CV

### Using VS Code (with LaTeX Workshop)
- **Auto-build**: Enabled by default — saves automatically compile to PDF
- **Manual build**: Right-click in editor → "Build LaTeX project"
- **View PDF**: Click "View PDF" in LaTeX Workshop panel

### Using Command Line
```bash
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=. cv_latex.tex
```

Output: `cv_latex.pdf` in the project root

## Customizing Your CV

Edit [cv_latex.tex](cv_latex.tex) to customize your CV content.

### Using the `\jobentry` Command
For consistent job formatting, use the custom `\jobentry` command:

```latex
\jobentry{Job Title}{Company Name}{Location}{Start Date - End Date}
{
    Description of your role and achievements.
}
{Tech Stack: Technology1, Technology2, Technology3}
```

### Available Sections
The template includes the following sections:
- Header with name and contact information
- Objective/Summary
- Technical Stack
- Professional Experience
- Education
- Community Service
- Languages
- Extra-Curricular Activities

### Best Practices
- Keep the existing `res.cls` file unless you need custom styling
- Use the `\jobentry` command for consistency
- Maintain the structure between `\begin{resume}` and `\end{resume}`
- Use `\section{Section Name}` for new sections

## Automated Releases

GitHub Actions automatically builds and publishes your CV when you push a git tag.

### How It Works
1. Make your changes to [cv_latex.tex](cv_latex.tex) and commit them
2. Create and push a version tag:
   ```bash
   git tag 2026.02
   git push origin 2026.02
   ```
3. GitHub Actions automatically compiles the LaTeX, creates a release, and attaches the PDF

Visit the [Releases Page](../../releases) to download compiled PDFs from any tagged version.

## Project Structure

```
cv/
├── cv_latex.tex              # Your CV content (edit this file)
├── res.cls                   # LaTeX resume class for styling
├── cv_latex.pdf              # Generated PDF output (gitignored)
├── LICENSE                   # MIT License
├── README.md                 # This file
├── .devcontainer/
│   ├── Dockerfile            # LaTeX environment setup
│   └── devcontainer.json     # VS Code dev container configuration
├── .github/
│   └── workflows/
│       └── create-release.yml  # Automated release workflow
└── .vscode/                  # VS Code workspace settings
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

