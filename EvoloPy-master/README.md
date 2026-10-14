<div align="center">

# 🐝 EvoloPy-master (fork)

**A local fork of EvoloPy, a Python library of nature-inspired optimization algorithms.**

![Python](https://img.shields.io/badge/Python-3.6%2B-blue)
![Upstream](https://img.shields.io/badge/upstream-v4.0.6-informational)
![Status](https://img.shields.io/badge/status-reviewed%20·%20fixes%20pending-orange)
![README style](https://img.shields.io/badge/README-Amazing%20GitHub%20Template-brightgreen)

[About](#about) &nbsp;·&nbsp; [State](#state) &nbsp;·&nbsp; [Proposed simplification](#proposed-simplification-2026-10-11) &nbsp;·&nbsp; [Sources](#acknowledgements--sources)

</div>

---

## Table of Contents

- [About](#about)
- [State](#state)
- [Proposed simplification (2026-10-11)](#proposed-simplification-2026-10-11)
- [Acknowledgements & Sources](#acknowledgements--sources)

## About

[EvoloPy](https://github.com/7ossam81/EvoloPy) is a Python library of nature-inspired
optimization algorithms (PSO, GWO, MVO and others) with benchmark functions. This folder holds
a fork of it. The library itself is in [`EvoloPy-master/`](EvoloPy-master/); its own
[README](EvoloPy-master/README.md) belongs to upstream and covers installation and usage.

## State

- **Original state** — an older fork that had drifted from upstream.
- **Current state** — synced to upstream **v4.0.6** (master @ `ce97ecf`).
- **Static review** — known bugs are logged in [`issues-evolopy.txt`](issues-evolopy.txt).
- **Simulation test run** — a randomized run (2026-10-08) confirmed and extended the static
  review; see [Simulation test run](issues-evolopy.txt#L160).
- **Fixes** — not all logged bugs are fixed yet.

## Proposed simplification (2026-10-11)

- **What** — delete `EvoloPy-master/examples/quickstart.ipynb`. It duplicates
  `evolopy_notebook_example.ipynb` in the same folder.
- **Why** — both files are 1-byte placeholders (a single space). They are not valid notebooks,
  and Jupyter cannot open them. Nothing in the repo references them.
- **Evidence**
  - `md5sum`: both files hash to `7215ee9c7d9dc229d2921a40e899ec5f`.
  - `wc -c`: both files are `1` byte; `od -c` shows the single byte is a space.
  - On 2026-10-11, before this README existed, `git grep -nI -e quickstart -e evolopy_notebook_example`
    from the repo root: no hits.
  - Temp copy of `EvoloPy-master/`: after deleting `quickstart.ipynb`, `examples/` keeps
    `evolopy_notebook_example.ipynb`, `example.ipynb` and the `.py` examples, and
    `grep -rnI` for both names finds no hits. The delete breaks no link or import.
- **Note** — `evolopy_notebook_example.ipynb` is also empty. Keep it, or restore real content
  from upstream EvoloPy. This suggestion does not delete it.
- **Status** — suggestion only. Not applied: the folder is kept close to upstream.

## Acknowledgements & Sources

- **README template** — structured after the
  [Amazing GitHub Template](https://github.com/dec0dOS/amazing-github-template) by **dec0dOS**,
  discovered via the [**awesome-readme**](https://github.com/matiassingers/awesome-readme) list
  curated by **Matias Singers**.
- **Upstream** — [7ossam81/EvoloPy](https://github.com/7ossam81/EvoloPy). The source, license
  and per-algorithm references belong to the upstream authors; see the
  [upstream README](EvoloPy-master/README.md).
