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
| Output | **PDF** (native) | **Editable `.docx`** (export a PDF from Word) |
| Fidelity to the brand | Highest (matches the original LaTeX template) | Very faithful, not pixel-perfect |
| Editable by recipients | No (PDF) | **Yes** (Word) |
| Languages | **English + Persian (RTL)** | English |
| Needs | the `typst` binary (~30 MB) | Python + `python-docx` |
| Speed | Instant, live preview | Fast |
| Use when… | you want the best-looking PDF | recipients must edit the file in Word |

Each approach is **self-contained** and has its own `README.md` (how to use it
by hand) and `SKILL.md` (instructions for the AI assistant).

## Using with Claude Desktop (Agent Skills)

Each approach folder is also a **Claude Desktop / Claude Code skill** — its
`SKILL.md` tells Claude how to gather your content and build the document.

- **Install:** copy the approach folder into your skills directory
  (`~/.claude/skills/`), or zip the folder and upload it via Claude Desktop →
  Customize → Skills → **+**. The **folder name becomes the skill name**, so the
  skills are best installed under the names `karun-report-typst/` and
  `karun-report-word/` (those names are already set in each `SKILL.md`).
- **Use:** open a chat, describe the report you want, and Claude follows the
  skill — it writes the content into the template files and builds into `build/`.
- **Building:** Claude must be able to run `typst` / `python` for the *build*
  step. If your Claude Desktop setup can't run local commands, the skill still
  writes all the source files and gives you the exact one-line build command to
  run yourself. (Claude Code can run the build directly.)

## Structure

```
.
├── README.md            ← you are here
├── typst/               ← Typst approach (PDF, bilingual)
│   ├── README.md  SKILL.md
│   ├── karun.typ        ← the template engine — do NOT edit
│   ├── metadata.typ     ← EDIT: report metadata
│   ├── report.typ       ← EDIT: report content
│   ├── fonts/           ← bundled Dubai font (--font-path fonts)
│   └── images/          ← brand assets (bg, logos)
└── word/                ← Word approach (editable .docx)
    ├── README.md  SKILL.md  requirements.txt
    ├── karun_report.py  ← the template engine — do NOT edit
    ├── report.json      ← EDIT: report content
    └── assets/          ← brand assets (bg, logos)
```

## Prerequisites

- **Typst approach:** the `typst` binary on your PATH. Download the single
  executable from <https://github.com/typst/typst/releases/latest>.
- **Word approach:** Python 3.9+ and `python-docx`
  (`pip install -r word/requirements.txt`). To get a PDF, open the `.docx` in
  Microsoft Word and **Save As → PDF**.
- **Font:** the Typst approach **bundles Dubai** (applied with `--font-path
  fonts`), so nothing to install. The Word approach uses your system **Dubai**
  font — install it for an exact match, otherwise Word substitutes a default.

No PowerShell scripts are used or required; everything runs through the
`python` and `typst` commands directly.

## Quick start

Every generated document is written into that approach's **`build/`** folder.

**Typst** (best-looking PDF):
```sh
cd typst
# edit metadata.typ and report.typ, then:
typst compile --font-path fonts report.typ "build/My Report.pdf"
```

**Word** (editable .docx):
```sh
cd word
pip install -r requirements.txt                       # once
# edit report.json, then:
python karun_report.py report.json "build/My Report.docx"
# then open the .docx in Word and Save As → PDF if you need a PDF
```

See each approach's `README.md` for full details and `SKILL.md` for how an AI
assistant should drive it.

## Troubleshooting

- **`typst` is not recognized / "command not found".** The `typst` binary must
  be on your PATH. If you just installed it (or it was just added to PATH),
  **open a new terminal and restart Claude Desktop** so the updated PATH is
  picked up. As a fallback, call it by its full path, e.g.
  `"C:\path\to\typst.exe" compile report.typ "build/My Report.pdf"`.
- **`python` is not recognized.** Install Python 3.9+ and reopen the terminal.
