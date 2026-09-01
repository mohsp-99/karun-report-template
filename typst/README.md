# Karun Report Template — Typst

Generates a branded Karun report as a **native PDF**. Bilingual: English (LTR)
and Persian (RTL). This is a Typst port of the original Karun LaTeX template.

## Files

| File / folder      | Edit?   | Purpose                                              |
|--------------------|---------|-----------------------------------------------------|
| `karun.typ`        | **No**  | The template engine: colors, cover, header/footer, headings, TOC, classification toggles |
| `karun-fa-style.typ` | **No** | Persian companion library for hand-numbered RTL reports (see `FA-STYLE.md`) |
| `metadata.typ`     | **Yes** | Per-report metadata (title, client, date, classification…) |
| `report.typ`       | **Yes** | Your report content                                  |
| `fonts/`           | **No**  | Bundled Dubai font (applied via `--font-path fonts`) |
| `images/`          | add to  | Brand assets (`bg.jpeg`, `karun-en/fa.png`) + your figures |

## Build

From inside the `typst/` folder (output goes into `build/`). The `--font-path
fonts` flag makes it use the bundled Dubai font, so no system install is needed:

```sh
typst compile --font-path fonts report.typ "build/My Report.pdf"
typst watch  --font-path fonts report.typ "build/My Report.pdf"   # live preview
```

> **`typst` not recognized?** It must be on your PATH. If it was just installed
> or added to PATH, open a new terminal / restart Claude Desktop, or call it by
> its full path (e.g. `"C:\path\to\typst.exe" compile …`).

## Writing a report

1. Edit **`metadata.typ`** — title, subtitle, summary title, client, author,
   `access_level` (1 Internal / 2 External / 3 Public), `confidentiality`
   (1 Normal / 2 Confidential / 3 Top Secret), document ID, date, year.
2. Write content in **`report.typ`** using plain Typst markup:
   - `= Section`, `== Subsection` — auto-numbered, Karun-blue.
   - `*bold*`, `_italic_`, `` `code` ``.
   - `- item` for bullet lists.
   - `"quotes"` and `---` become curly quotes / em-dashes automatically.
   - `#figure(image("images/x.png", width: 100%), caption: [ … ])` — image, caption **below**.
   - Use `table.header(...)` for the first row of every report table. This marks
     the row semantically and lets Typst repeat it when a long table continues:

     ```typ
     #figure(
       table(
         columns: (1fr, 2fr),
         table.header([Item], [Finding]),
         [A], [First finding],
         [B], [Second finding],
       ),
       caption: [Example findings.],
     )
     ```

     The caption appears **above** (LaTeX-style) and is auto-numbered "Table N"
     / «جدول N». The template automatically gives report tables a Karun-blue
     header with white text, subtle blue rules, and type slightly smaller than
     the main body.
   - `#heading(level: 1, numbering: none)[Title]` — unnumbered heading that
     still appears in the Table of Contents (e.g. an executive summary).
3. Put any figures in `images/` and reference them as `images/your-figure.png`.

## Pagination helpers

Use the smallest helper that expresses the intended grouping:

- `#keep-with-next[Short introduction.]` keeps a short paragraph with the table
  or figure immediately after it.
- `#keep-together[Short prose plus a small table or figure.]` keeps the entire
  compact group on one page. Do not use it for content taller than a page.
- Wrap a table that genuinely needs multiple pages in `#long-table[...]`, and
  mark its header repeatable:

  ```typ
  #long-table[
    #figure(
      table(
        columns: (1fr, 2fr),
        table.header(repeat: true)[Item][Finding],
        // many body cells …
      ),
      caption: [Detailed findings.],
    )
  ]
  ```

Headings already stay with the content that follows. These helpers are for the
additional prose/table relationships that Typst cannot infer automatically.

## Language

In `report.typ`, the three lines that set language are:

```typ
#show: karun-report.with(lang: "en", meta: meta)
#title-page(meta, lang: "en")
#contents-page(lang: "en")
```

Change `"en"` to `"fa"` for a full Persian, right-to-left document (it switches
the logo, labels, page-number text, and text direction). In Persian mode, all
**auto-generated** numbers — heading numbers, figure/table numbers, page
numbers, footnotes — render in Persian digits (۱۲۳). Latin technical content
you type (standards and quantities such as `ISO 2768` and `6063-T6`) is left as
written, so mixed Persian/Latin technical content stays correct.

Persian source text must use ی-style spelling directly: never Arabic `ة`
(write `ی`) and never the hamza ezafe forms `هٔ` / `ۀ` (write `ه‌ی`, e.g.
`نمونه‌ی` not `نمونهٔ`). There is deliberately no render-time substitution:
replacing characters at render time breaks Arabic letter joining, and B Nazanin
has no glyph for the combining hamza — so wrong forms must be fixed in the
source before compiling.

For Persian reports in the hand-numbered, Dubai-body house style (sections
numbered in the heading text, table captions above / figure captions below, the
`sn`/`lt`/`nb` bidi discipline), use the `karun-fa-style.typ` companion library
and follow `FA-STYLE.md`. The compact reference is
`examples/fa-style-regression.typ`.

## Notes

- Fonts are bundled in `fonts/` and applied via `--font-path fonts`, so no system
  install is needed: **Dubai** for English, **B Nazanin** (12pt, the Persian book
  standard) for Persian. Latin technical codes inside Persian text are rendered
  slightly smaller in Dubai, so `ANT02-A0000`, `ISO 2768`, and `215 MPa` remain
  legible without visually overpowering the Persian paragraph.
- The cover is unnumbered and excluded from the count; the running footer numbers
  the body pages "Page 1 of N" through "Page N of N".
