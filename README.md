# homebrew-individual-coreutils

Homebrew tap for [individual-coreutils](https://github.com/tomgidden/individual-coreutils):
standalone GNU coreutils utilities for macOS, one formula per utility,
for the handful that have no BSD/Apple equivalent (`timeout`, `nproc`,
`shuf`, ...). No full `coreutils` build, no `g`-prefixed duplicates of
tools you already have.

## Install

```
brew tap tomgidden/individual-coreutils
brew install timeout
```

(Installs as `gtimeout`; `timeout` is symlinked to it automatically,
since nothing on stock macOS already provides a `timeout` command. See
[individual-coreutils](https://github.com/tomgidden/individual-coreutils#why-g-prefixed)
for why.)

## What's here

Each `Formula/<name>.rb` just downloads a pre-built release asset from
individual-coreutils and installs it -- no local compiling, no build
dependencies. The actual build (from official, GPG-verified coreutils
source) happens in individual-coreutils' CI; see that repo for how.

Formulae are regenerated after each individual-coreutils release via
`scripts/generate-formulae.sh` -- not maintained by hand, to avoid the
9 near-identical files drifting out of sync with each other.

## License

Formula code here is whatever license you'd like to treat trivial
Ruby DSL files as (effectively public domain / CC0 in spirit -- no
real license file needed for these). The binaries the formulae
install are GNU coreutils, GPLv3+.
