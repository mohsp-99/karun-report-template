# Karun Report Template

A template repository for generating **branded Karun reports** as **PDF** — the
cover page with the swoosh background and logo, a metadata table with
strike-through classification toggles, an auto Table of Contents, Karun-blue
numbered headings, justified body text, and figures with captions.

It is designed to be driven by an **AI assistant (e.g. Claude Desktop)**: point
the assistant at this folder, describe the report you want in plain language,
and it fills in the content and builds the document. You can also use it by hand.

The report is built with **Typst** (`typst/`), which produces a native **PDF**
that matches the Karun brand and supports **English (LTR) and Persian (RTL)**.
It needs the `typst` binary (~30 MB, a single executable).

The `typst/` folder is self-contained and has its own `README.md` (how to use it
by hand) and `SKILL.md` (instructions for the AI assistant).

## Using with Claude Desktop (Agent Skills)

The `typst/` folder is also a **Claude Desktop / Claude Code skill** — its
`SKILL.md` tells Claude how to gather your content and build the document.

- **Install:** copy the folder into your skills directory (`~/.claude/skills/`),
  or zip the folder and upload it via Claude Desktop → Customize → Skills →
  **+**. The **folder name becomes the skill name**, so it is best installed
  under the name `karun-report-typst/` (that name is already set in `SKILL.md`).
- **Use:** open a chat, describe the report you want, and Claude follows the
  skill — it writes the content into the template files and builds into `build/`.
- **Building:** Claude must be able to run `typst` for the *build* step. If your
  Claude Desktop setup can't run local commands, the skill still writes all the
  source files and gives you the exact one-line build command to run yourself.
  (Claude Code can run the build directly.)

## Using with Claude Code on the web (cloud environment)

You can run this template in a **Claude Code cloud environment** so it comes
pre-installed with `typst` and is ready to build reports — no local setup.

1. Go to **claude.ai/code → New cloud environment**.
2. **Name:** e.g. `karun-report`. **Network access:** `Trusted`.
3. **Setup script:** paste the one-liner below (it downloads and runs
   [`scripts/cloud-setup.sh`](scripts/cloud-setup.sh)):

   ```bash
   #!/bin/bash
   curl -fsSL https://raw.githubusercontent.com/mohsp-99/karun-report-template/main/scripts/cloud-setup.sh | bash
   ```

   Prefer no network dependency at start-up? Paste the full contents of
   `scripts/cloud-setup.sh` instead — it is self-contained.
4. **Create environment**, then start a session and describe the report you want.

The setup script clones this repo into the workspace, installs `typst`, and
**removes `.git`** — so the assistant's edits stay local and never open a pull
request back to this template.

## Structure

```
.
├── README.md            ← you are here
└── typst/               ← Typst approach (PDF, bilingual)
    ├── README.md  SKILL.md
    ├── karun.typ        ← the template engine — do NOT edit
    ├── metadata.typ     ← EDIT: report metadata
    ├── report.typ       ← EDIT: report content
    ├── fonts/           ← bundled Dubai font (--font-path fonts)
    └── images/          ← brand assets (bg, logos)
```

## Prerequisites

- The `typst` binary on your PATH. Download the single executable from
  <https://github.com/typst/typst/releases/latest>.
- **Font:** the template **bundles Dubai** (applied with `--font-path fonts`),
  so nothing to install.

## Quick start

Every generated document is written into the **`build/`** folder.

```sh
cd typst
# edit metadata.typ and report.typ, then:
typst compile --font-path fonts report.typ "build/My Report.pdf"
typst watch  --font-path fonts report.typ "build/My Report.pdf"   # live preview
```

See `typst/README.md` for full details and `typst/SKILL.md` for how an AI
assistant should drive it.

## Troubleshooting

- **`typst` is not recognized / "command not found".** The `typst` binary must
  be on your PATH. If you just installed it (or it was just added to PATH),
  **open a new terminal and restart Claude Desktop** so the updated PATH is
  picked up. As a fallback, call it by its full path, e.g.
  `"C:\path\to\typst.exe" compile report.typ "build/My Report.pdf"`.
</content>
</invoke>
