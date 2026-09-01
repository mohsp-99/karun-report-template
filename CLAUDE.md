# Karun report template — agent guide

Typst template that turns user-provided content into a branded Karun PDF,
in English (LTR) or Persian (RTL). `typst/SKILL.md` is the authoritative
workflow reference; `typst/README.md` and `typst/DIAGRAMS.md` are extended docs.

## Repo layout

- `typst/karun.typ` — the engine: colors, cover, headers/footers, typography,
  table branding, pagination helpers. Shared by every report.
- `typst/metadata.typ` — cover/header fields for the current report.
- `typst/report.typ` — the report body and the `lang` setting.
- `typst/karun-diagrams.typ` + `typst/DIAGRAMS.md` — SmartArt-style diagram toolkit.
- `typst/karun-fa-style.typ` + `typst/FA-STYLE.md` — Persian companion library
  and conventions for hand-numbered RTL reports (Dubai body, `sn`/`lt`/`nb`
  bidi discipline).
- `typst/fonts/` — bundled Dubai (English/Latin) and B Nazanin (Persian) fonts.
- `typst/images/` — brand assets plus user-supplied report figures.
- `typst/examples/` — regression examples (`typography-regression.typ`,
  `diagram-gallery.typ`, `fa-style-regression.typ`).
- `typst/build/` — compile output, gitignored.

## What to edit

- Writing a report: edit only `typst/metadata.typ`, `typst/report.typ`, and add
  supplied figures to `typst/images/`. Never invent content, numbers, or metadata.
- Template maintenance (only when explicitly requested): edit `karun.typ` /
  fonts / brand assets / examples, and add or extend a regression example
  covering the change.
- Never restyle manually in the body what the engine already owns (fonts, table
  colors, Latin sizing, heading style). Preserve unrelated user work; no
  wholesale reverts for focused fixes.

## Writing a report

1. Fill every field in `metadata.typ`. `access_level`: 1 Internal / 2 External /
   3 Public. `confidentiality`: 1 Normal / 2 Confidential / 3 Top Secret.
2. Set the same `lang` (`"en"` or `"fa"`) on all three setup calls in `report.typ`:

   ```typ
   #show: karun-report.with(lang: "fa", meta: meta)
   #title-page(meta, lang: "fa")        // optional: agent: "Agent Name" adds a cover stamp
   #contents-page(lang: "fa")
   ```

3. Body markup: `= Section`, `== Subsection` (auto-numbered, Karun blue);
   `#heading(level: 1, numbering: none)[Title]` for unnumbered-but-in-TOC;
   `*bold*`, `_italic_`, `` `code` ``, `- item`, blank-line paragraphs;
   `#figure(image("images/x.png", width: 100%), caption: [...])` (caption below).
4. Persian text uses ی-style spelling: never Arabic `ة` (write `ی`), and never
   hamza ezafe `هٔ` / `ۀ` (write `ه‌ی`, e.g. `نمونه‌ی` not `نمونهٔ`). Fix these
   in user-authored Persian content. Type Latin codes (`ISO 2768`, `215 MPa`,
   `ANT02-A0000`) as-is — no manual direction marks or resizing; the engine
   renders them in Dubai, slightly smaller than the Persian body.

## Tables

Always use `table.header(...)` for the first row:

```typ
#figure(
  table(
    columns: (1fr, 2fr),
    table.header([Item], [Finding]),
    [A], [First finding],
  ),
  caption: [Example findings.],
)
```

The engine styles report tables automatically: caption above, Karun-blue header
row with white bold text, blue-tinted gridlines, and type smaller than the body.

## Pagination

- Headings stick to the content after them automatically.
- `#keep-with-next[Short lead-in.]` — put immediately before a table/figure so
  the lead-in isn't stranded at a page bottom.
- `#keep-together[...]` — a compact prose+table/figure group that must share one
  page. Never wrap content taller than a page.
- `#long-table[ #figure(table(... table.header(repeat: true, ...) ...)) ]` — a
  table too tall for one page; it breaks across pages and repeats its header.
  Ordinary table figures never break.

## Compile and verify

From `typst/` (`--font-path fonts` is required):

```text
typst compile --font-path fonts report.typ build/report.pdf
```

Examples compile from `typst/examples/` with `--root .. --font-path ../fonts`.
To render pages for visual checks:

```text
typst compile --font-path fonts report.typ "build/page-{p}.png" --format png --ppi 100
```

Always inspect the output: RTL direction, font fallback, overflow/clipping,
table pagination, stranded headings, blank pages. Fix warnings and recompile.
Do not claim visual validation without rendering and looking at the pages.
