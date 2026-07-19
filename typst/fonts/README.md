# Bundled fonts

Fonts are bundled so the report builds with the exact look without a system-wide
install. The template picks the font by report language:

- **English** → **Dubai** (`font: "Dubai"`).
- **Persian** → **B Nazanin** (`font: "B Nazanin"`), the traditional Persian
  book face, with Dubai kept as a glyph fallback. Latin runs inside Persian text
  (technical codes, standards, units) are routed back to Dubai so codes like
  `ANT02-A0000` stay in clean Latin digits.

## Dubai (English)

Files (`DubaiW23-*.ttf`): Light (300), Regular (400), Medium (500), Bold (700).
All four share the family name **`Dubai`** and are selected by weight, so
`font: "Dubai"` picks Regular for body text and Bold for headings.

## B Nazanin (Persian)

Files: `BNazanin.ttf` (Regular) and `BNazaninBold.ttf` (Bold), both family
name **`B Nazanin`**. Used at 12pt for Persian body text (the Nazanin family
sits small on the em; 12–13pt is the Persian book standard). Copyright Borna
Rayaneh; distributed as freeware and bundled here only to build these reports.
If you have a licensed copy, it will match. To swap it for another Persian face
(e.g. Vazirmatn), drop the `.ttf`s here and change `font` in `karun.typ`.

## Build using these fonts

Point Typst at this folder with `--font-path` (no system install needed):

```sh
cd typst
typst compile --font-path fonts report.typ "build/<Report Title>.pdf"
```

If Dubai is already installed on your system, plain `typst compile` also works.

## License

Dubai Font is provided free of charge by the Government of Dubai. See
<https://dubaifont.com>. Redistribution here is for building these reports.
