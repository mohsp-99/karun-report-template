# Agent guide

This is a Typst-based Karun report template. Before generating or editing a
report, read `typst/SKILL.md`; it is the authoritative workflow and markup guide.

For routine report generation, edit only `typst/metadata.typ` and
`typst/report.typ`, plus user-provided report assets under `typst/images/`.
Shared engines, fonts, logos, and examples may change only when the user
explicitly requests template behavior or design maintenance. Keep those changes
focused and add a relevant regression example.

Never invent report content or data. For Persian reports, set `lang: "fa"` on
all three setup calls, preserve RTL structure, and normalize only user-authored
Persian report content to ی-style spelling: `ة` → `ی`, and hamza ezafe `هٔ` /
`ۀ` → `ه‌ی`. The engine owns Latin sizing and
branded table styles. Use `table.header(...)`, the pagination helpers in the
skill, and `#long-table[...]` for multi-page tables.

Compile from `typst/` with:

```text
typst compile --font-path fonts report.typ build/report.pdf
```

Inspect the PDF or rendered pages for RTL direction, font fallback, overflow,
clipping, table pagination, isolated headings, and blank pages. Do not claim
visual validation if it was not performed.

Preserve unrelated user work. Never destroy user changes or use a wholesale
history revert for a focused correction.
