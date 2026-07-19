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
- `#figure(image("images/x.png", width: 100%), caption: [ … ])` — image with the
  caption **below**; put figure files in `images/`.
- `#figure(table(columns: 2, [ … ], [ … ], …), caption: [ … ])` — a table with the
  caption **above** (LaTeX-style), auto-numbered "Table"/«جدول». The branded table
  look (shaded header, gridlines) is applied automatically — just supply the cells.
- A blank line starts a new paragraph.
- In Persian (`lang: "fa"`), auto-generated numbers (headings, figures/tables,
  pages, footnotes) render in Persian digits; text you type stays as written.

## Diagrams (SmartArt-style, grounded)
The template ships a diagram toolkit, **`karun-diagrams.typ`** — brand-consistent
process flows, cycles, hierarchies, matrices, pyramids, bar charts, gauges,
timelines, KPI tiles, and callouts. Use one when a described sequence, breakdown,
comparison, or set of measurements would read better as a figure. Import it next
to `karun.typ` and wrap each call in `diagram(...)`:

```typ
#import "karun-diagrams.typ": *
...
#diagram(
  process-flow([Measure], [Derive], [Score], [Publish]),
  caption: [ The analysis pipeline. ],
)
```

Feed a tool **only** labels and numbers already in the report — diagrams
visualize facts, they never invent them — and pick the tool whose shape matches
the section. Full catalog + "which tool for which content" table: **`DIAGRAMS.md`**.

## Persian (RTL)
Set `lang: "fa"` on all three setup lines and write the content in Persian.
Direction, the **B Nazanin** font (12pt), the Persian logo, labels, Persian
numerals, and page numbers all switch automatically. Latin technical codes you
type (e.g. `ANT02-A0000`, `ISO 2768`, `215 MPa`) stay in Latin/Dubai on their
own — just type them normally. The cover's legal disclaimer stays English by
design.

## More
- Full docs: `README.md`.
