---
name: karun-report-typst
description: Creates a branded Karun report as a PDF (English or Persian/RTL) from content the user provides. Use when the user wants to write or produce a Karun report, whitepaper, executive summary, product/strategy document, or any branded Karun PDF.
---

# Karun Report — Typst (PDF)

Turn the user's content into a branded Karun PDF using the Typst template in
**this skill's folder**. The user supplies only the *content*; you handle all
layout by editing two files and compiling.

**Do not edit `karun.typ`** — it is the template engine.

## Files (all paths are relative to this folder)
- `metadata.typ` — report metadata → **you edit this**
- `report.typ` — report content → **you edit this**
- `karun.typ`, `images/` — engine + brand assets → do not touch
- `examples/swift-product-vision/` — a full worked example to copy patterns from
- `build/` — write the output PDF here

## Steps
1. **Collect the content.** Gather the metadata (title, subtitle, summary title,
   client/recipient, author, access level, confidentiality, document ID, date)
   and the body. Infer structure from anything the user pastes; ask only for
   what's missing. Confirm the language: English or Persian.
2. **Edit `metadata.typ`** — fill every field.
   `access_level`: 1 Internal / 2 External / 3 Public.
   `confidentiality`: 1 Normal / 2 Confidential / 3 Top Secret.
3. **Edit `report.typ`** — set `lang` ("en" or "fa") on the three setup lines,
   then replace the placeholder content using the markup below.
4. **Build the PDF into `build/`:**
   ```
   typst compile report.typ "build/<Report Title>.pdf"
   ```
   - **If you can run shell commands here:** run it; if it fails to compile, read
     the error, fix the markup, and retry until it builds; then report the path.
   - **If you cannot run commands:** save the edited files and give the user the
     exact command above to run themselves.
   - **If `typst` is "not recognized":** it isn't on PATH — tell the user to open
     a new terminal / restart the app, or call the binary by its full path.

**Done when:** `report.typ` + `metadata.typ` reflect the user's content and
either the PDF is built in `build/` or the user has the exact build command.

## Markup (used inside `report.typ`)
- `= Section`, `== Subsection` — auto-numbered, Karun-blue headings.
- `*bold*`, `_italic_`, `` `code` ``.
- `- item` — bullet list.
- `"quotes"` and `---` auto-convert to curly quotes / em-dash.
- `#figure(image("images/x.png", width: 100%), caption: [ … ])` — put figure
  files in `images/`.
- `#heading(level: 1, numbering: none)[Executive Summary]` — an unnumbered
  heading that still appears in the Table of Contents.
- Separate paragraphs with a blank line.

## Persian (RTL)
Set `lang: "fa"` on all three setup lines, write the content in Persian, and use
Persian metadata. RTL, the Persian logo, labels, and page numbers are automatic;
the cover's legal disclaimer intentionally stays in English. Pattern reference:
`examples/persian-rtl-test.typ`.

## Notes
- Requires the `typst` binary and the **Dubai** font for an exact match.
- Need an *editable Word (.docx)* instead? Use the `karun-report-word` skill.
- Detailed docs: `README.md`. Full example: `examples/swift-product-vision/`.
