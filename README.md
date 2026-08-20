# homebrew-individual-coreutils

Homebrew tap with one formula per GNU coreutils utility, instead of
one formula for the whole suite. `brew install timeout` gets you just
`gtimeout`, not all ~105 binaries `brew install coreutils` would pull
in as a single unit.

This is a sibling project to
[individual-coreutils](https://github.com/tomgidden/individual-coreutils)
(same per-utility idea, no package manager, plain tarball downloads)
but fully independent of it -- see "What's here" below.

## Install

```
brew tap tomgidden/individual-coreutils
brew trust tomgidden/individual-coreutils
brew install timeout
```

(Installs as `gtimeout`; `timeout` is symlinked to it automatically,
if nothing on your machine already provides a `timeout` command --
checked live at install time, not assumed.)

`brew trust` is a newer Homebrew safety gate for non-official taps --
without it, `brew install`/`brew tap` may refuse to load formulae from
a tap that isn't `homebrew/core`. Run it once per tap (or formula; see
`brew trust --help`).

## What's here

Each `Formula/<name>.rb` downloads a pre-built release asset from
**this repo's own** GitHub Releases -- not individual-coreutils'. This
tap builds its own binaries from source (`scripts/build-tarball.sh`,
the same per-utility `make src/<name>` approach as individual-coreutils,
GPG-verified against the official coreutils tarball), rather than
repackaging Homebrew's own Cellar build (which carries NLS/gettext and
other bloat this project avoids) or depending on individual-coreutils'
releases.

This repo has **no independent versioning** -- it tracks whatever
coreutils version Homebrew's own `coreutils.rb` formula currently
pins, and rebuilds when that changes, so a user gets the same
coreutils version whether they came from `homebrew/core`'s own
`coreutils` or this tap. A lightweight scheduled workflow
(`.github/workflows/poll-coreutils-version.yml`) polls Homebrew's
formula a few times a day and only triggers the real build
(`.github/workflows/build-release.yml`) when the pinned version has
actually changed -- the full build doesn't need to run on a tight
schedule.

`.github/workflows/ground-truth.yml` installs the *real* Homebrew
`coreutils` formula occasionally, purely as a reference: to confirm
the pinned version and empirically record which utilities Homebrew
symlinks bare (unprefixed) vs `g`-only in `/opt/homebrew/bin`.

`utils.txt` and `scripts/build-common.sh` mirror individual-coreutils'
(same coreutils source, same per-utility build target, same excluded
`chcon`/`runcon` -- unbuildable under `--without-selinux`), but this
repo's build/release/formula pipeline is entirely its own.

Formulae are regenerated automatically after each build
(`scripts/generate-formulae.sh`) -- not maintained by hand, to avoid
~105 near-identical files drifting out of sync with each other.

## License

Formula code here is whatever license you'd like to treat trivial
Ruby DSL files as (effectively public domain / CC0 in spirit -- no
real license file needed for these). The binaries the formulae
install are GNU coreutils, GPLv3+.
