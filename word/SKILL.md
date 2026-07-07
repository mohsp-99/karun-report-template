---
name: karun-report-word
description: Creates a branded Karun report as an editable Word (.docx) document from content the user provides. Use when the user wants a Karun report, whitepaper, executive summary, or branded Karun document they can open and edit in Microsoft Word.
---

# Karun Report — Word (.docx)

Turn the user's content into a branded, editable Word document using the
python-docx engine in **this skill's folder**. The user supplies only the
*content*; you write a JSON file and run the engine.

**Do not edit `karun_report.py`** — it is the template engine.

## Files (all paths are relative to this folder)
- `report.json` — report content → **you edit/overwrite this** (or make a new .json)
- `karun_report.py`, `assets/` — engine + brand assets → do not touch
- `build/` — write the output `.docx` here

## Steps
1. **Collect the content.** Gather the metadata and body. Infer structure from
   anything the user pastes; ask only for what's missing.
2. **Write the content JSON** (`report.json`, or a new file) using the schema
   below. Put figure images next to the JSON, in an `images/` subfolder, or in
   `assets/`.
3. **Build the .docx into `build/`:**
   ```
   python karun_report.py report.json "build/<Report Title>.docx"
   ```
   - **If you can run shell commands here:** run it and report the output path.
   - **If you cannot:** save the JSON and give the user the exact command.
4. **Delivering a PDF?** The user exports it themselves: open the `.docx` in
   Microsoft Word and use **File → Save As → PDF** (say yes to "update fields" so
   the Table of Contents and page numbers populate). For a native PDF instead,
   use the `karun-report-typst` skill.

**Done when:** the content JSON reflects the user's content and the `.docx` is
built in `build/` (or the user has the exact build command).

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
- **Page breaks**: `{ "type": "pagebreak" }` starts a section on a new page.
- One `paragraph` item per paragraph.

## Notes
- Requires `python-docx` (`pip install -r requirements.txt`) and the **Dubai**
  font for an exact match.
- English only. For Persian/RTL or a native PDF, use the `karun-report-typst`
  skill.
- Detailed docs: `README.md`.
