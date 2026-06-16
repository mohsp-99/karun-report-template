# Karun Report Templates

A template repository for generating **branded Karun reports** — the cover page
with the swoosh background and logo, a metadata table with strike-through
classification toggles, an auto Table of Contents, Karun-blue numbered headings,
justified body text, and figures with captions.

It is designed to be driven by an **AI assistant (e.g. Claude Desktop)**: point
the assistant at this folder, describe the report you want in plain language,
and it fills in the content and builds the document. You can also use it by hand.

There are **two parallel approaches**. Pick one per report:

| | **Typst** (`typst/`) | **Word** (`word/`) |
|---|---|---|
| Output | **PDF** (native) | **Editable `.docx`** (+ optional PDF) |
| Fidelity to the brand | Highest (matches the original LaTeX template) | Very faithful, not pixel-perfect |
| Editable by recipients | No (PDF) | **Yes** (Word) |
| Languages | **English + Persian (RTL)** | English |
| Needs | the `typst` binary (~30 MB) | Python + `python-docx` |
| Speed | Instant, live preview | Fast |
| Use when… | you want the best-looking PDF | recipients must edit the file in Word |

Each approach is **self-contained** and has its own `README.md` (how to use it
by hand) and `SKILL.md` (instructions for the AI assistant).

## Structure

```
.
├── README.md            ← you are here
├── typst/               ← Typst approach (PDF, bilingual)
│   ├── README.md  SKILL.md
│   ├── karun.typ        ← the template engine — do NOT edit
│   ├── metadata.typ     ← EDIT: report metadata
│   ├── report.typ       ← EDIT: report content
│   ├── images/          ← brand assets (bg, logos)
│   ├── examples/        ← worked example + Persian test
│   └── samples/         ← sample output PDF
└── word/                ← Word approach (editable .docx)
    ├── README.md  SKILL.md  requirements.txt
    ├── karun_report.py  ← the template engine — do NOT edit
    ├── export_pdf.py    ← optional .docx → .pdf (LibreOffice)
    ├── report.json      ← EDIT: report content
    ├── assets/          ← brand assets (bg, logos)
    ├── examples/        ← worked example (with figures)
    └── samples/         ← sample output PDF
```

The `samples/` folders contain a finished example — **"Redefining SWIFT"** —
so you can see exactly what each approach produces. That document is a *sample
of the output*, not the template itself.

## Prerequisites

- **Typst approach:** the `typst` binary on your PATH. Download the single
  executable from <https://github.com/typst/typst/releases/latest>.
- **Word approach:** Python 3.9+ and `python-docx`
  (`pip install -r word/requirements.txt`). For automated PDF export,
  LibreOffice (optional — you can also Save As PDF from Word).
- **Font:** install **Dubai** (the font used by the original template) for an
  exact match. Without it, a default sans-serif is substituted.

No PowerShell scripts are used or required; everything runs through the
`python` and `typst` commands directly.

## Quick start

**Typst** (best-looking PDF):
```sh
cd typst
# edit metadata.typ and report.typ, then:
typst compile report.typ "My Report.pdf"
```

**Word** (editable .docx):
```sh
cd word
pip install -r requirements.txt          # once
# edit report.json, then:
python karun_report.py report.json "My Report.docx"
python export_pdf.py "My Report.docx"    # optional PDF
```

See each approach's `README.md` for full details and `SKILL.md` for how an AI
assistant should drive it.
