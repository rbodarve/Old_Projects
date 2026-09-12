<div align="center">

# ♟️ Dama

**A two-player desktop Dama game in Java Swing — self-contained, downloadable, and zero-setup.**

![Java](https://img.shields.io/badge/Java-17%2B-orange)
![Build](https://img.shields.io/badge/build-Gradle-02303A)
![Database](https://img.shields.io/badge/database-SQLite%20(embedded)-003B57)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)

[Download & Run](#installation) &nbsp;·&nbsp; [How to Play](#usage) &nbsp;·&nbsp; [Example Games](docs/example-games.txt) &nbsp;·&nbsp; [Build from Source](#build-from-source)

</div>

---

## Table of Contents

- [About](#about)
  - [Features](#features)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Build from Source](#build-from-source)
- [Usage](#usage)
  - [Rules & Scoring](#rules--scoring)
  - [Example Games](#example-games)
- [Project Structure](#project-structure)
- [Modernization & Fixes](#modernization--fixes)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## About

Dama is a hot-seat (two humans, one computer) desktop board game. It began life as a
MySQL-backed Java **applet** and has been modernized into a self-contained desktop
application: it no longer depends on a browser plugin or an external database server, and
it runs from a single downloadable JAR. Player statistics and high scores are kept in a
small **SQLite** file that the app creates automatically on first launch.

### Features

- Full 8×8 Dama: diagonal moves, **mandatory** captures, multi-jump chains, and king
  promotion.
- **Deferred promotion** — a man crowns on reaching the back row and the turn ends, *unless*
  it can immediately keep capturing from that square (then it stays a man and jumps on,
  crowning only if it finally stops on the back row).
- Backward captures are permitted for ordinary men (a rule of this variant).
- **Points system:** +1 per completed turn (a simple move, a single capture, or a whole
  multi-jump chain each count once), +5 for crowning a King, +10 to the opponent on a
  resignation, and no bonus for a draw.
- **Resign** and **Draw** buttons, plus automatic win detection when a player has no legal move.
- Per-player statistics and two leaderboards: **By Points** and **By Moves** (fewest moves
  to *win* a game).
- **Zero setup:** stats live in a local SQLite database at `~/.dama/dama.db`,
  created on first run — no server, accounts, or configuration.

### Built With

- [Java](https://adoptium.net/) 17+ with **Swing** (AWT/Swing GUI)
- [SQLite](https://www.sqlite.org/) via the [xerial sqlite-jdbc](https://github.com/xerial/sqlite-jdbc) driver (bundled)
- [Gradle](https://gradle.org/) (wrapper included — no local install needed)

## Getting Started

### Prerequisites

- **To run a release JAR:** Java 17 or newer — [download from Adoptium](https://adoptium.net/).
- **To build from source:** a JDK 17+. Gradle itself is fetched automatically by the
  included wrapper on first build.

### Installation

> **Requires Java 17+ — this is a JAR, not an installer.** There is nothing to install:
> you download a file and run it with Java. If you don't have Java 17 or newer, install it
> first from [Adoptium](https://adoptium.net/).

1. Download `dama.jar` from the [Releases](../../releases) page.
2. Run it:
   ```sh
   java -jar dama.jar
   ```
   On most desktops you can also just double-click the JAR.

The database is created automatically at `~/.dama/dama.db` the first time you run.

### Build from Source

```sh
# Linux / macOS
./gradlew jar

# Windows
gradlew.bat jar
```

The self-contained, runnable "fat" JAR is written to `build/libs/dama.jar` — the SQLite
driver is bundled inside it, so there is nothing else to download to run.

To compile and launch directly during development:

```sh
./gradlew run
```

## Usage

1. **Game → New Game** (or the **New Game** button).
2. Create players with **New Player**, then pick two with **Player 1** / **Player 2** and
   **Start Game**. (The **✕** in any prompt's title bar cancels setup and returns to the game.)
3. Click a piece to select it (legal destinations are highlighted), then click a destination
   to move. If any capture is available you **must** take one; multi-jumps continue
   automatically within the same turn.
4. Use **Resign** to concede or **Draw** to end the game by mutual agreement.
5. The **Statistics** menu shows player profiles and the **By Points** / **By Moves**
   high-score tables.

### Rules & Scoring

- **RED = Player 1** starts on the bottom rows and moves *up*; **BLACK = Player 2** starts on
  the top rows and moves *down*. RED moves first.
- Captures are mandatory, multi-jumps must be completed in one turn, and (in this variant)
  ordinary men may capture backward.
- **Deferred promotion:** reaching the back row crowns the piece and ends the turn, unless a
  further capture is available from that square.
- **Scoring:** +1 per completed turn · +5 for crowning a King · +10 to the opponent on a
  resignation · no bonus for a draw. "Fewest moves" records only a player's *winning* games.
- A game ends when a player has no legal move (a loss), or via the **Resign** or **Draw** buttons.

### Example Games

Five fully worked, rules-checked games — two wins by resignation (RED and BLACK), a draw, and
two wins by capturing every enemy piece (RED and BLACK) — plus two constructed positions that
isolate the deferred-promotion rule, each with move lists, board diagrams, and the resulting
score, are documented in [`docs/example-games.txt`](docs/example-games.txt). The original
scoring design notes are in [`docs/point-system.txt`](docs/point-system.txt).

## Project Structure

```
Dama/
├─ src/main/java/Dama.java       # game, Swing UI, and SQLite data access (single class)
├─ docs/
│  ├─ example-games.txt          # five worked sample games + two promotion examples
│  └─ point-system.txt           # original design notes for the scoring
├─ legacy/CheckersErik.java      # earlier, superseded version — kept for reference, not built
├─ build.gradle                  # build config (produces the self-contained JAR)
├─ settings.gradle
└─ gradlew · gradlew.bat · gradle/wrapper/   # Gradle wrapper (no local Gradle install needed)
```

## Modernization & Fixes

This version keeps the original game and data-access logic intact while making the project
runnable and distributable today:

- **Runs on modern Java:** the main class no longer `extends Applet` (removed in modern JDKs)
  and now `extends JPanel`.
- **Embedded database:** the MySQL connection was replaced with a zero-setup, file-based
  SQLite database, so no server or configuration is required.
- **Packaging:** a Gradle build (with wrapper) produces a single self-contained runnable JAR.
- **Game-logic corrections:** the points system now attributes each turn's score to the
  correct player and counts a multi-jump chain once; promotion follows the deferred-promotion
  rule; a **Draw** option and its statistics were added; and the "fewest moves" leaderboard was
  fixed to track *fewest moves to win*.
- **UI & interaction fixes:** the ✕ button now cancels the player-setup flow at any step; the
  board is larger and uses higher-contrast squares so both colours read clearly; edge-of-board
  clicks are hit-tested correctly; and the statistics tables auto-size their columns with
  clearer headers (the opponent name now shows as **Opponent (Pts)** / **Opponent (Moves)**
  rather than the misleading "Opponent Point"/"Opponent Moves").
- **Code hardening:** the Swing UI is built on the Event Dispatch Thread; promotion no longer
  relies on shared mutable `static` flags (`makeMove` reports a crowning via its return value);
  and database `ResultSet`s are scoped to each query instead of a shared field.

## License

No explicit license file is bundled in this folder — it is part of a personal
`Old_Projects` archive. Add a `LICENSE` before redistributing.

## Acknowledgements

- **README template:** structured after the
  [Amazing GitHub Template](https://github.com/dec0dOS/amazing-github-template) by **dec0dOS**,
  discovered via the [**awesome-readme**](https://github.com/matiassingers/awesome-readme) list
  curated by **Matias Singers**.
- **Game foundation:** the board and Swing UI descend from the classic educational checkers
  example in David J. Eck's *Introduction to Programming Using Java*.
- **Libraries & tooling:** [xerial/sqlite-jdbc](https://github.com/xerial/sqlite-jdbc) and
  [Gradle](https://gradle.org/).
