<div align="center">

# 🏛️ UPMin_System

**A legacy PHP intranet (circa 2011) for the University of the Philippines Mindanao —
personnel training, HR, and research/faculty management.**

![PHP](https://img.shields.io/badge/PHP-5.x%20(legacy)-777BB4)
![Database](https://img.shields.io/badge/database-MySQL%20(mysql__*)-4479A1)
![Status](https://img.shields.io/badge/status-archived%20·%20non--runnable-red)
![README style](https://img.shields.io/badge/README-Amazing%20GitHub%20Template-brightgreen)

[About](#about) &nbsp;·&nbsp; [Modules](#modules) &nbsp;·&nbsp; [Functions](#core-functions-classestrainingclassphp) &nbsp;·&nbsp; [Issues](#known-issues) &nbsp;·&nbsp; [Sources](#acknowledgements--sources)

</div>

---

> **Status: archived / non-runnable snapshot.** This is an incomplete fragment of a larger
> deployment. Core dependencies (`core.class.php`, the `middletier` layer) are missing, and the
> code targets a PHP version (5.x, `mysql_*` API, `register_globals`) that no longer exists. It
> is kept for reference, not for execution.

## Table of Contents

- [About](#about)
- [Modules](#modules)
- [Structure](#structure)
- [Core Functions (`classes/training.class.php`)](#core-functions-classestrainingclassphp)
- [Known Issues](#known-issues)
- [Acknowledgements & Sources](#acknowledgements--sources)

## About

A homegrown MVC-ish PHP app: a `Core` base class + per-entity model classes + procedural
`.inc.php` view/action includes, routed through a `switch($task)` dispatcher in each module's
`index.php`. Six MySQL databases back it: `upmin_setup`, `upmin_training`, `upmin_hrdo`,
`upmin_msp`, `upmin_common`, `upmin_spmo_admin`.

## Modules

| Path            | Purpose |
|-----------------|---------|
| `pt/`           | Personnel Trainings — admin (add/edit/delete trainings, UP + non-UP participants, file uploads) |
| `pt_user/`      | Personnel Trainings — end-user "My Trainings" view |
| `msp/`          | Research/HEI management — faculty, colleges, projects, funding, researchers |
| `research/`     | Overlapping research module (funding, publications, journals, researchers) |
| `classes/hrdo/` | HR data office models — employment, positions, salaries, family, etc. (models only, no UI here) |
| `system/`       | A **partial duplicate / older copy** of `pt` and `pt_user` |

## Structure

- **354 PHP files**, 4 SQL dumps.
- Non-code files also committed: 27 uploaded JPGs (`pt/uploads/`), 3 `.docx` design docs
  (`documentation/`), and an unrelated **6.4 MB `Cinema 4d tut.pdf`**.
- Routing pattern: each module's `index.php` runs `switch($task)` and `include_once`s the
  matching `.inc.php` (see `pt/add/index.php`).
- Entity classes (e.g. `classes/training.class.php`) extend `Core` and embed their own SQL.
- Data model (`upmin_training`): `training`, `participant_training`, `np_participant`
  (non-UP participants), `budget`.

## Core Functions (`classes/training.class.php`)

| Function                | What it does |
|-------------------------|--------------|
| `loadAll()`             | List all trainings |
| `search($s)`            | Search trainings by title / location / city / participant / date |
| `load_ID($id)`          | Load a single training into the object |
| `load_training($id)`    | Load UP participants for a training |
| `loadNP($id)` / `loadnonup($id)` | Load non-UP participants for a training / by id |
| `save()` / `update($id)` | Insert / update a training |
| `savenp()` / `updatenp($id)` / `deletenp($id)` | Manage non-UP participants |
| `delete($id)`           | Delete a training and its participant/budget rows |
| `getID()`               | Look up a training id by title/location/city/date |

## Known Issues

### Will not run as committed
- `classes/training.class.php` does `include_once("/../core.class.php")` — an invalid path, and
  **no `core.class.php` exists anywhere** in the tree.
- `home.inc.php` includes `classes/middletier/setup/userrole.class.php` — the `middletier`
  directory **does not exist**. This tree is a fragment of a larger system.

### Obsolete platform
- Uses `mysql_*` functions (removed in PHP 7).
- Relies on `register_globals`-era behavior: `$task` and `$_SESSION[userType]` (unquoted array
  key) are assumed to be pre-populated. Runs on no supported PHP version.

### Security
- **SQL injection throughout** — every query interpolates raw input, e.g.
  `search($s)` → `... LIKE '%$s%'`. No escaping anywhere.
- **Hardcoded credentials** — `root` with no password baked into each model class.

### Bugs
- `getID()` — trailing comma before `FROM` and an unbalanced `(` in the `WHERE`; the query is
  malformed and errors.
- Field inconsistency — `load_ID()` writes `$this->descr`, but the declared property is `$desc`
  and `save()` reads `$this->desc`; descriptions do not round-trip.
- Leftover `echo $sql` debug statements in `save`/`delete`/`updatenp` corrupt output.

### Repo hygiene
- `system/` mirrors part of the top level with divergent copies (every shared file differs) —
  no single source of truth.
- Binary uploads, Office docs, and a large unrelated PDF are committed alongside code.

## Acknowledgements & Sources

- **README template** — [Amazing GitHub Template](https://github.com/dec0dOS/amazing-github-template)
  by **dec0dOS**, via [awesome-readme](https://github.com/matiassingers/awesome-readme) (**Matias Singers**).
- **Origin** — internal administrative system developed for the University of the Philippines
  Mindanao (HRDO / SPMO / research offices), circa 2011. Original design notes are in
  `documentation/` (`Personnel-Training Management System*.docx`).
- **Database dumps** — exported with [phpMyAdmin](https://www.phpmyadmin.net/) (v3.2.4,
  MySQL 5.1), see `*.sql`.
- **Note** — this README is a documentation/review pass only; the application code is unchanged
  and no original authorship of the 2011 system is claimed here.
