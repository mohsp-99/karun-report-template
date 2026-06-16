# Karun Report Template — Typst

Generates a branded Karun report as a **native PDF**. Bilingual: English (LTR)
and Persian (RTL). This is a Typst port of the original Karun LaTeX template.

## Files

| File / folder      | Edit?   | Purpose                                              |
|--------------------|---------|-----------------------------------------------------|
| `karun.typ`        | **No**  | The template engine: colors, cover, header/footer, headings, TOC, classification toggles |
| `metadata.typ`     | **Yes** | Per-report metadata (title, client, date, classification…) |
| `report.typ`       | **Yes** | Your report content                                  |
| `images/`          | add to  | Brand assets (`bg.jpeg`, `karun-en/fa.png`) + your figures |
| `examples/`        | —       | Worked example (`swift-product-vision/`) + Persian RTL test |
| `samples/`         | —       | Sample output PDF                                    |

## Build

From inside the `typst/` folder (output goes into `build/`):

```sh
typst compile report.typ "build/My Report.pdf"
typst watch  report.typ "build/My Report.pdf"   # live preview while editing
```

To build the bundled example (it lives in a subfolder, so pass `--root` so it
can find `karun.typ`):

```sh
typst compile --root . examples/swift-product-vision/main-article.typ "build/Redefining SWIFT.pdf"
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
   - `#figure(image("images/x.png", width: 100%), caption: [ … ])`.
   - `#heading(level: 1, numbering: none)[Title]` — unnumbered heading that
     still appears in the Table of Contents (e.g. an executive summary).
3. Put any figures in `images/` and reference them as `images/your-figure.png`.

## Language

In `report.typ`, the two lines that set language are:

```typ
#show: karun-report.with(lang: "en", meta: meta)
#title-page(meta, lang: "en")
#contents-page(lang: "en")
```

Change `"en"` to `"fa"` for a full Persian, right-to-left document (it switches
the logo, labels, page-number text, and text direction). See
`examples/persian-rtl-test.typ`.

## Notes

- Requires the **Dubai** font installed (same as the original template).
- The cover is page 1 (unnumbered); page numbering shows "Page 1 of N" from the
  Table of Contents onward, matching the LaTeX template.
