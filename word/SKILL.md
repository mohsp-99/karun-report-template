---
name: karun-report-word
description: Generate a branded Karun report as an editable Word (.docx) document (and optional PDF) using the python-docx template in this folder. Use whenever the user wants a Karun report, whitepaper, executive summary, or formal Karun-branded document that recipients must be able to EDIT in Word. The user describes the content; you write report.json and run the engine.
---

# Karun Report — Word

This folder is a template for branded Karun reports as editable Word `.docx`
files (English). The user supplies the *content* in plain language; you write it
into a JSON file and run the engine. Do not edit `karun_report.py`.

## Workflow

1. **Gather content conversationally.** Determine the metadata (title, subtitle,
   summary title, client/recipient, author, access level, confidentiality,
   document ID, date, year) and the body (sections, subsections, paragraphs,
   lists, figures). Ask only for what's missing; infer structure from a pasted
   draft.

2. **Write a content JSON** (copy `report.json` or create a new file) following
   the schema below. Save figure image files next to it, in an `images/`
   subfolder, or in `assets/`.

3. **Build the document:**
   ```sh
   python karun_report.py <content.json> "<Report Title>.docx"
   ```

4. **Optionally export a PDF:**
   ```sh
   python export_pdf.py "<Report Title>.docx"
   ```
   (Uses LibreOffice if present. If not, tell the user to open the .docx in Word
   and Save As PDF, or to use the Typst approach for a native PDF.)

5. **Hand the file(s) to the user** and summarize what you produced.

## Content JSON schema

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
    "year": 2025
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

### Rules
- **Headings** auto-number: level 1 → `1, 2, 3…`, level 2 → `1.1, 1.2…`. Use
  `"numbered": false` for an unnumbered heading that still appears in the TOC.
- **Inline markup**: `**bold**`, `*italic*`, `` `code` ``. Use real typographic
  characters (`“ ”`, `—`).
- **Figures**: number captions yourself via `caption_label` ("Figure 1", …).
- **Page breaks**: add `{ "type": "pagebreak" }` to start a section on a new page.
- Keep each paragraph as its own `paragraph` item.

## Reference
- A complete worked example: `examples/swift-product-vision.json` (+ figures).
- Full human documentation: `README.md`.

## Notes / limits
- Requires `python-docx` (`pip install -r requirements.txt`) and the **Dubai**
  font for an exact match.
- English only. For Persian/RTL, or for the highest-fidelity PDF, use the Typst
  approach in the sibling `typst/` folder.
- When the user opens the .docx in Word it may prompt to "update fields" — that
  populates the Table of Contents and page numbers; this is expected.
