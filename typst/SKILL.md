---
name: karun-report-typst
description: Creates a branded Karun report as a PDF (English or Persian/RTL) from content the user provides. Use when the user wants to write or produce a Karun report, whitepaper, executive summary, product/strategy document, or any branded Karun PDF.
---

# Karun Report — Typst (PDF)

Turn the user's content into a branded Karun PDF. You edit two files and compile;
the user supplies only the content, never the layout.

## What you touch
- **`metadata.typ`** — cover/header fields (title, client, date, classification…).
- **`report.typ`** — the report body, plus the `lang` setting (`"en"` or `"fa"`).
- **Nothing else.** `karun.typ` (engine), `images/` (brand assets), and `fonts/`
  (the Dubai font) produce the branding and layout — leave them alone.

## Steps
1. **Gather content.** The metadata (title, subtitle, summary title, recipient,
   author, access level, confidentiality, document ID, date) and the body. Infer
   structure from whatever the user pastes; ask only for what's missing, and
   confirm the language.
2. **Fill in `metadata.typ`** — every field.
   `access_level`: 1 Internal / 2 External / 3 Public.
   `confidentiality`: 1 Normal / 2 Confidential / 3 Top Secret.
3. **Write `report.typ`** — set `lang` on the three setup lines, then replace the
   placeholder content using the markup below.
4. **Compile** into `build/`:
   ```
   typst compile --font-path fonts report.typ "build/<Report Title>.pdf"
   ```
   `--font-path fonts` applies the bundled Dubai font, so no system install is
   needed. If it won't compile, read the error, fix the markup, and retry. If
   `typst` is "not recognized", it isn't on PATH — restart the terminal/app or
   use its full path. If you can't run commands, save the files and hand the user
   the exact command.

**Done when** both files reflect the user's content and the PDF is in `build/`
(or the user has the exact command to run).

## Markup (inside `report.typ`)
- `= Section`, `== Subsection` — auto-numbered, Karun-blue headings.
- `#heading(level: 1, numbering: none)[Executive Summary]` — unnumbered heading,
  still listed in the Table of Contents.
- `*bold*`, `_italic_`, `` `code` ``, and `- item` for bullet lists.
- `"quotes"` and `---` auto-convert to curly quotes / em-dash.
- `#figure(image("images/x.png", width: 100%), caption: [ … ])` — put figure
  files in `images/`.
- A blank line starts a new paragraph.

## Persian (RTL)
Set `lang: "fa"` on all three setup lines and write the content in Persian.
Direction, the Persian logo, labels, and page numbers switch automatically; the
cover's legal disclaimer stays in English by design.

## More
- Full docs: `README.md`.
- Need an editable Word (.docx) instead? Use the `karun-report-word` skill.
