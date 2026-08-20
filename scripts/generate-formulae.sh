#!/usr/bin/env bash
# Regenerates Formula/*.rb for every utility in utils.txt, pointing at
# THIS repo's own GitHub Releases (not individual-coreutils' -- this
# tap builds its own binaries from source, see build-tarball.sh),
# by downloading each release asset and computing its sha256.
#
# Run this after build-release.yml cuts a new release (it does so
# automatically as part of that workflow); the coreutils version IS
# the release tag here, since this repo has no independent versioning
# of its own -- it just tracks whatever Homebrew's own formula pins.
#
# Usage: scripts/generate-formulae.sh <coreutils-version> [util ...]
#   scripts/generate-formulae.sh 9.11              # all of utils.txt
#   scripts/generate-formulae.sh 9.11 timeout nproc # just these

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
THIS_REPO="tomgidden/homebrew-individual-coreutils"

CU_VERSION="${1:?usage: generate-formulae.sh <coreutils-version> [util ...]}"
shift
utils=("$@")

if [[ ${#utils[@]} -eq 0 ]]; then
  utils_file="${ROOT_DIR}/utils.txt"
  [[ -f "$utils_file" ]] || { echo "generate-formulae.sh: $utils_file not found" >&2; exit 1; }
  while IFS= read -r line; do
    line="${line%%#*}"
    line="$(echo "$line" | tr -d '[:space:]')"
    [[ -z "$line" ]] && continue
    utils+=("$line")
  done < "$utils_file"
fi

# Homebrew's own camelization rule (docs.brew.sh/Formula-Cookbook):
# hyphens/underscores mark word boundaries, each word capitalized,
# separators dropped -- e.g. sdl_mixer.rb => SdlMixer. None of our
# utility names have separators, so this only needs to capitalize the
# first letter. Avoid GNU sed's \U (macOS ships BSD sed, which doesn't
# support it -- it'd emit a literal "U").
class_name() {
  local words word result=""
  IFS='_-' read -ra words <<< "$1"
  for word in "${words[@]}"; do
    result+="$(tr '[:lower:]' '[:upper:]' <<< "${word:0:1}")${word:1}"
  done
  echo "$result"
}

CACHE_DIR="${ROOT_DIR}/.formula-cache"
mkdir -p "$CACHE_DIR"
mkdir -p "$ROOT_DIR/Formula"

for u in "${utils[@]}"; do
  echo "==> $u"
  arm_asset="homebrew-individual-coreutils-${u}-${CU_VERSION}-arm64-apple-darwin.tar.gz"
  x86_asset="homebrew-individual-coreutils-${u}-${CU_VERSION}-x86_64-apple-darwin.tar.gz"
  arm_url="https://github.com/${THIS_REPO}/releases/download/${CU_VERSION}/${arm_asset}"
  x86_url="https://github.com/${THIS_REPO}/releases/download/${CU_VERSION}/${x86_asset}"

  arm_file="$CACHE_DIR/$arm_asset"
  x86_file="$CACHE_DIR/$x86_asset"
  [[ -f "$arm_file" ]] || curl -sSL -o "$arm_file" "$arm_url"
  [[ -f "$x86_file" ]] || curl -sSL -o "$x86_file" "$x86_url"

  arm_sha="$(shasum -a 256 "$arm_file" | awk '{print $1}')"
  x86_sha="$(shasum -a 256 "$x86_file" | awk '{print $1}')"

  cname="$(class_name "$u")"

  cat > "$ROOT_DIR/Formula/$u.rb" <<RUBY
class $cname < Formula
  desc "GNU coreutils' $u, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/${THIS_REPO}"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "$arm_url"
      sha256 "$arm_sha"
    end
    on_intel do
      url "$x86_url"
      sha256 "$x86_sha"
    end
  end

  def install
    bin.install "bin/g$u"
    man1.install "share/man/man1/g$u.1" if File.exist?("share/man/man1/g$u.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "$u" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "g$u" => "$u" unless which("$u")
  end

  test do
    system "#{bin}/g$u", "--version"
  end
end
RUBY

  echo "    wrote Formula/$u.rb"
done
