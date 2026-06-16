---
name: karun-report-typst
description: Generate a branded Karun report as a PDF using the Typst template in this folder. Use whenever the user wants to write, draft, or produce a Karun report, whitepaper, executive summary, or formal Karun-branded PDF — in English or Persian. The user describes the content; you fill in metadata.typ and report.typ and compile with Typst.
---

# Karun Report — Typst

This folder is a Typst template for branded Karun reports (PDF output, English
or Persian/RTL). The user supplies the *content* in plain language; you write it
into `report.typ` + `metadata.typ` and compile. Do not edit `karun.typ`.

## Workflow

1. **Gather content conversationally.** Determine the metadata (title, subtitle,
   summary title, client/recipient, author, access level, confidentiality,
   document ID, date, year) and the body (sections, subsections, paragraphs,
   lists, figures). Ask only for what's missing; infer structure from a pasted
   draft. Confirm the language: English (`"en"`) or Persian (`"fa"`).

2. **Fill in `metadata.typ`.** Set every field. `access_level`: 1 Internal /
   2 External / 3 Public. `confidentiality`: 1 Normal / 2 Confidential /
   3 Top Secret.

3. **Write `report.typ`.** Keep the three setup lines (set `lang` on all three);
   replace the content placeholder with the real content using Typst markup:
   - `= Section`, `== Subsection` (auto-numbered, Karun-blue).
   - `*bold*`, `_italic_`, `` `code` ``.
   - `- item` for bullet lists.
   - `#figure(image("images/x.png", width: 100%), caption: [ … ])` — put figure
     files in `images/`.
   - `#heading(level: 1, numbering: none)[Executive Summary]` for an unnumbered
     section that still appears in the Table of Contents.
   - Use real `"quotes"` and `---` (they auto-convert to curly quotes / em-dash).
   - Separate paragraphs with a blank line.

4. **Compile** from this folder:
   ```sh
   typst compile report.typ "<Report Title>.pdf"
   ```
   Report any compile errors to yourself and fix the markup until it builds.

5. **Hand the PDF to the user** and summarize what you produced.

## For a Persian report
Set `lang: "fa"` in the three setup lines of `report.typ`, write the content in
Persian, and use Persian metadata values. The template handles RTL, the Persian
logo, labels, and page-number text automatically. The legal disclaimer on the
cover intentionally stays in English.

## Reference
- A complete worked example: `examples/swift-product-vision/`.
- A Persian/RTL example: `examples/persian-rtl-test.typ`.
- Full human documentation: `README.md`.

## Notes / limits
- Requires the `typst` binary on PATH and the **Dubai** font installed.
- Output is a PDF. If the user needs an *editable Word* file, use the Word
  approach in the sibling `word/` folder instead.
