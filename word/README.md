# Karun Report Template — Word

Generates a branded Karun report as an **editable Word `.docx`** (and,
optionally, a PDF). English only (the Persian/RTL variant lives in the Typst
approach). Built on `python-docx`.

## Files

| File / folder     | Edit?   | Purpose                                                |
|-------------------|---------|--------------------------------------------------------|
| `karun_report.py` | **No**  | The template engine: cover, header/footer, headings, TOC, toggles |
| `export_pdf.py`   | **No**  | Optional `.docx` → `.pdf` via LibreOffice               |
| `report.json`     | **Yes** | Your report content                                    |
| `assets/`         | —       | Brand assets (`bg.jpeg`, `karun-en/fa.png`)            |
| `examples/`       | —       | Worked example (`swift-product-vision.json` + figures) |
| `samples/`        | —       | Sample output PDF                                      |

## Setup (once)

```sh
pip install -r requirements.txt
```

## Build

Output goes into the `build/` folder:

```sh
python karun_report.py report.json "build/My Report.docx"
python export_pdf.py "build/My Report.docx" "build/My Report.pdf"   # optional
```

## Writing a report — `report.json`

```jsonc
{
  "lang": "en",
  "meta": {
    "title": "Main report title",
    "subtitle": "Cover subtitle",
    "summary_title": "Executive Summary: …",   // metadata table + running header
    "client_label": "Prepared for:",           // or "Client:"
    "client": "Recipient / Department / Company",
    "prepared_by": "Author / Department / Company",
    "access_level": 1,                // 1 Internal, 2 External, 3 Public
    "confidentiality": 3,             // 1 Normal, 2 Confidential, 3 Top Secret
    "doc_id": "XXX-YY-V01-20260101",
    "date": "2026/05/18",             // YYYY/MM/DD
    "year": 2025                      // copyright year on the cover
  },
  "body": [
    { "type": "heading", "level": 1, "text": "Section title" },
    { "type": "heading", "level": 1, "numbered": false, "text": "Executive Summary" },
    { "type": "heading", "level": 2, "text": "Subsection title" },
    { "type": "paragraph", "text": "Body text with **bold**, *italic*, `code`." },
    { "type": "list", "items": ["First **bullet**.", "Second with `code`."] },
    { "type": "figure", "image": "fig-1.png", "caption_label": "Figure 1",
      "caption": "Caption, supports **bold** / *italic*." },
    { "type": "pagebreak" }
  ]
}
```

Rules:
- **Headings** auto-number: level 1 → `1, 2, 3…`, level 2 → `1.1, 1.2…`. Use
  `"numbered": false` for an unnumbered heading that still appears in the TOC.
- **Inline markup**: `**bold**`, `*italic*`, `` `code` ``. Use real typographic
  characters (`“ ”`, `—`).
- **Figures**: place the image next to `report.json`, in an `images/` subfolder,
  or in `assets/`. Number captions yourself via `caption_label`.
- **Page breaks**: add `{ "type": "pagebreak" }` to start a section on a new page.

## Getting the PDF

`export_pdf.py` uses **LibreOffice** if installed (it updates the Table of
Contents and page numbers on the way). If you don't have LibreOffice, just open
the `.docx` in Microsoft Word and use **File → Save As → PDF**. (Or use the
Typst approach for an instant, native PDF.)

When you open the `.docx` in Word, it may prompt to **update fields** — say yes,
so the Table of Contents and page numbers populate.

## Notes

- Requires the **Dubai** font for an exact match (otherwise Word substitutes).
- Output is *visually faithful* to the Karun template, not pixel-identical to the
  LaTeX/Typst PDF (Word lays out lines differently).
