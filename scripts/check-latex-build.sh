#!/usr/bin/env bash
# Pre-commit check: the CV must compile, and no line may run past the margin.
# Builds into a temporary directory so the working tree is left untouched.
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

out_dir="$(mktemp -d)"
trap 'rm -rf "$out_dir"' EXIT

if ! pdflatex -interaction=nonstopmode -halt-on-error -output-directory="$out_dir" cv_latex.tex >/dev/null; then
    echo "cv_latex.tex does not compile:"
    grep -A 3 '^!' "$out_dir/cv_latex.log" || tail -n 20 "$out_dir/cv_latex.log"
    exit 1
fi

if grep -A 1 '^Overfull \\hbox' "$out_dir/cv_latex.log"; then
    echo
    echo "The lines above run past the right margin. Reword them or reorder the list."
    exit 1
fi
