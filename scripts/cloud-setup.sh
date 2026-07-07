#!/usr/bin/env bash
#
# Cloud-environment setup for the Karun report template.
#
# Paste this into the "Setup script" box when creating a Claude Code cloud
# environment (claude.ai/code -> New cloud environment), OR run it yourself in
# any fresh Linux workspace. It is self-contained and idempotent:
#
#   1. makes sure the template files are present in the working directory
#      (clones the public repo if they are not already there),
#   2. removes .git so the assistant's edits never open a pull request back
#      to the source repository,
#   3. installs the `typst` binary (native, brand-faithful PDF output),
#   4. installs `python-docx` (the Word / .docx approach).
#
# Re-running it is safe — each step is skipped if it is already satisfied.

set -euo pipefail

REPO_URL="https://github.com/mohsp-99/karun-report-template.git"

echo "==> Setting up the Karun report template environment"

# 1. Ensure the template files are in the current working directory. -----------
#    (If the environment already checked the repo out, this is a no-op.)
if [ ! -d typst ] || [ ! -d word ]; then
  echo "==> Cloning template into $(pwd)"
  tmp="$(mktemp -d)"
  git clone --depth 1 "$REPO_URL" "$tmp"
  # Copy everything (including dotfiles) into the current directory.
  cp -a "$tmp/." ./
  rm -rf "$tmp"
fi

# 2. Sever git history so assistant edits never turn into a PR. ----------------
rm -rf .git

# 3. Install Typst. ------------------------------------------------------------
if ! command -v typst >/dev/null 2>&1; then
  echo "==> Installing typst"
  tmp="$(mktemp -d)"
  curl -fsSL \
    "https://github.com/typst/typst/releases/latest/download/typst-x86_64-unknown-linux-musl.tar.xz" \
    -o "$tmp/typst.tar.xz"
  tar -xf "$tmp/typst.tar.xz" -C "$tmp" --strip-components=1
  if command -v sudo >/dev/null 2>&1 && sudo -n true 2>/dev/null; then
    sudo install -m 0755 "$tmp/typst" /usr/local/bin/typst
  else
    mkdir -p "$HOME/.local/bin"
    install -m 0755 "$tmp/typst" "$HOME/.local/bin/typst"
    echo "    typst installed to \$HOME/.local/bin (make sure it is on PATH)"
  fi
  rm -rf "$tmp"
else
  echo "==> typst already installed"
fi

# 4. Install the Word approach's Python dependency. ----------------------------
echo "==> Installing python-docx"
python3 -m pip install --quiet --upgrade pip 2>/dev/null || true
python3 -m pip install --quiet -r word/requirements.txt \
  || python3 -m pip install --quiet --user -r word/requirements.txt \
  || python3 -m pip install --quiet --break-system-packages -r word/requirements.txt

# 5. Verify. -------------------------------------------------------------------
echo "==> Verifying installation"
if command -v typst >/dev/null 2>&1; then
  typst --version
else
  echo "    NOTE: typst is not on PATH — try \$HOME/.local/bin/typst"
fi
python3 -c "import docx; print('python-docx', docx.__version__)"

echo "==> Done. The Karun report template is ready to use."
