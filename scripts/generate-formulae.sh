#!/usr/bin/env bash
# Regenerates Formula/*.rb for every utility in a given
# individual-coreutils release, by downloading each release asset and
# computing its sha256. Run this after individual-coreutils cuts a new
# release.
#
# Usage: scripts/generate-formulae.sh <tag> <coreutils-version> <util ...>
#   scripts/generate-formulae.sh v0.1.0 9.11 timeout nproc shuf tac numfmt b2sum shred basenc base32

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
UPSTREAM_REPO="tomgidden/individual-coreutils"

TAG="${1:?usage: generate-formulae.sh <tag> <coreutils-version> <util ...>}"
CU_VERSION="${2:?usage: generate-formulae.sh <tag> <coreutils-version> <util ...>}"
shift 2
utils=("$@")

if [[ ${#utils[@]} -eq 0 ]]; then
  echo "generate-formulae.sh: no utilities given" >&2
  exit 1
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

for u in "${utils[@]}"; do
  echo "==> $u"
  arm_asset="individual-coreutils-${u}-${CU_VERSION}-arm64-apple-darwin.tar.gz"
  x86_asset="individual-coreutils-${u}-${CU_VERSION}-x86_64-apple-darwin.tar.gz"
  arm_url="https://github.com/${UPSTREAM_REPO}/releases/download/${TAG}/${arm_asset}"
  x86_url="https://github.com/${UPSTREAM_REPO}/releases/download/${TAG}/${x86_asset}"

  arm_file="$CACHE_DIR/$arm_asset"
  x86_file="$CACHE_DIR/$x86_asset"
  [[ -f "$arm_file" ]] || curl -sSL -o "$arm_file" "$arm_url"
  [[ -f "$x86_file" ]] || curl -sSL -o "$x86_file" "$x86_url"

  arm_sha="$(shasum -a 256 "$arm_file" | awk '{print $1}')"
  x86_sha="$(shasum -a 256 "$x86_file" | awk '{print $1}')"

  cname="$(class_name "$u")"

  cat > "$ROOT_DIR/Formula/$u.rb" <<RUBY
class $cname < Formula
  desc "GNU coreutils' $u, standalone (no macOS equivalent exists)"
  homepage "https://github.com/${UPSTREAM_REPO}"
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
