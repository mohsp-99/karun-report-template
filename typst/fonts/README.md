# Dubai font

The **Dubai** font family used by the template, bundled so the report builds
with the exact brand look without a system-wide install.

Files (`DubaiW23-*.ttf`): Light (300), Regular (400), Medium (500), Bold (700).
All four share the family name **`Dubai`** and are selected by weight, so the
template's `font: "Dubai"` picks Regular for body text and Bold for headings.

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
