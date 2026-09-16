<div align="center">

# 📁 Old Projects

**An archive of older academic and personal projects, revisited in spare time.**

![Languages](https://img.shields.io/badge/languages-Java%20%7C%20Python%20%7C%20PHP%20%7C%20Prolog%20%7C%20C%2B%2B-blue)
![Status](https://img.shields.io/badge/status-archived%20%26%20revisited-lightgrey)
![README style](https://img.shields.io/badge/README-Amazing%20GitHub%20Template-brightgreen)

[Projects](#projects) &nbsp;·&nbsp; [State Summary](#state-summary) &nbsp;·&nbsp; [Layout](#layout) &nbsp;·&nbsp; [Sources](#acknowledgements--sources)

</div>

---

## Table of Contents

- [About](#about)
- [Projects](#projects)
- [State Summary](#state-summary)
- [Layout](#layout)
- [Acknowledgements & Sources](#acknowledgements--sources)

## About

Most of these were written years ago against tooling that has since aged out (PHP 5, Java
applets, deprecated APIs); each was revisited to modernize, review, or simply document it.
Every folder below notes **its original state** and **where it stands now**, and carries its
own `README.md` with full detail and independent source citations — this page is the map.

## Projects

| Folder | What it is | Original state | Current state |
|--------|------------|----------------|---------------|
| [CMSC_170/](CMSC_170/) | AI coursework (C++, Java, Prolog) | Loose source files dumped by topic, no README, mojibake in some Prolog files | Organized and documented per topic; runnable file-by-file; encoding caveats noted |
| [Dama/](Dama/) | Two-player Dama board game (Java Swing) | MySQL-backed Java **applet** — needed a browser plugin and an external DB server | Self-contained desktop app: embedded **SQLite**, single runnable JAR, **Gradle** build; reviewed gameplay/UI bugs fixed across three passes, incl. strict flying-King capture blockers and a Resign confirmation (see [docs/issues.txt](Dama/docs/issues.txt)) |
| [Deep-transfer-learning…GSA…/](Deep-transfer-learning-with-gravitational-search-algorithm-for-enhanced-plant-disease-classification-main/) | Plant-disease image classifier (MobileNetV2 + Gravitational Search Algorithm) | Notebook with a **fabricated** `accuracy × 2` metric and no real GSA | Rebuilt, working Colab notebook: genuine GSA hyperparameter search and honest test metrics |
| [EvoloPy-master/](EvoloPy-master/) | Nature-inspired optimization library (Python) | Older fork, drifted from upstream | Synced to upstream **v4.0.6**; static review logged known bugs (see [issues-evolopy.txt](EvoloPy-master/issues-evolopy.txt)) — not yet all fixed |
| [UPMin_System/](UPMin_System/) | 2011 PHP intranet (personnel training, HR, research) | Legacy PHP 5 app using `mysql_*`, SQL-injectable, missing core files | Unchanged — kept as an **archived, non-runnable snapshot**; README documents its structure and defects |

## State Summary

- **Modernized & working** — Dama, the GSA plant-disease notebook.
- **Organized & documented** — CMSC_170 (coursework kept as-is, now navigable).
- **Reviewed, fixes pending** — EvoloPy-master (issues logged, not all resolved).
- **Archived reference only** — UPMin_System (obsolete platform; not revived).

## Layout

```
Old_Projects/
├── CMSC_170/            # C++ / Java / Prolog AI coursework
├── Dama/                # Java Swing board game (Gradle, SQLite)
├── Deep-transfer-…-main/ # MobileNetV2 + GSA plant-disease notebook
├── EvoloPy-master/      # Python optimization library (upstream fork)
└── UPMin_System/        # legacy 2011 PHP intranet (archived)
```

## Acknowledgements & Sources

- **README template** — structured after the
  [Amazing GitHub Template](https://github.com/dec0dOS/amazing-github-template) by **dec0dOS**,
  discovered via the [**awesome-readme**](https://github.com/matiassingers/awesome-readme) list
  curated by **Matias Singers**. Every README in this workspace follows the same template and
  cites its own sources independently.
- **Per-project sources** — upstream repositories, datasets, and academic references are cited
  in each folder's own `README.md` (see the [Projects](#projects) table).
