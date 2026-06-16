"""
Export a .docx to .pdf using LibreOffice (no PowerShell, no extra Python deps).

LibreOffice updates the Table of Contents and page-number fields when it loads
the document, so the exported PDF is complete.

Usage:
    python export_pdf.py <input.docx> [output.pdf]

Requires LibreOffice installed (the `soffice` command). If it is not found,
the script prints instructions: you can also just open the .docx in Microsoft
Word and use File > Save As > PDF, or use the Typst approach for an instant PDF.
"""

import shutil
import subprocess
import sys
from pathlib import Path

# Common LibreOffice locations if `soffice` is not on PATH.
_CANDIDATES = [
    r"C:\Program Files\LibreOffice\program\soffice.exe",
    r"C:\Program Files (x86)\LibreOffice\program\soffice.exe",
    "/Applications/LibreOffice.app/Contents/MacOS/soffice",
    "/usr/bin/soffice",
    "/usr/local/bin/soffice",
]


def find_soffice():
    exe = shutil.which("soffice") or shutil.which("libreoffice")
    if exe:
        return exe
    for c in _CANDIDATES:
        if Path(c).exists():
            return c
    return None


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    docx = Path(sys.argv[1]).resolve()
    if not docx.exists():
        print(f"Not found: {docx}", file=sys.stderr)
        sys.exit(1)
    pdf = Path(sys.argv[2]).resolve() if len(sys.argv) > 2 else docx.with_suffix(".pdf")

    soffice = find_soffice()
    if not soffice:
        print(
            "LibreOffice (soffice) was not found.\n"
            "  - Install LibreOffice, OR\n"
            "  - open the .docx in Microsoft Word and use File > Save As > PDF, OR\n"
            "  - use the Typst approach (../typst) for an instant, native PDF.",
            file=sys.stderr,
        )
        sys.exit(2)

    subprocess.run(
        [soffice, "--headless", "--convert-to", "pdf", "--outdir",
         str(pdf.parent), str(docx)],
        check=True,
    )
    produced = pdf.parent / (docx.stem + ".pdf")
    if produced != pdf and produced.exists():
        produced.replace(pdf)
    print(f"Wrote {pdf}")


if __name__ == "__main__":
    main()
