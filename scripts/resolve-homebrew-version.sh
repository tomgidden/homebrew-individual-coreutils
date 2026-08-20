#!/usr/bin/env bash
# Shared helper: resolve the coreutils version currently pinned by
# Homebrew's own coreutils.rb formula. Sourced by build-tarball.sh and
# the version-poll workflow, so both agree on exactly one way to parse
# it out of the formula.

resolve_homebrew_coreutils_version() {
  local formula_url="https://raw.githubusercontent.com/Homebrew/homebrew-core/main/Formula/c/coreutils.rb"
  local formula version
  formula="$(curl -sSL "$formula_url")"
  # e.g.: url "https://ftpmirror.gnu.org/gnu/coreutils/coreutils-9.11.tar.xz"
  version="$(echo "$formula" | grep -o 'coreutils-[0-9][0-9.]*\.tar\.xz' | head -1 | sed -E 's/coreutils-([0-9.]+)\.tar\.xz/\1/')"
  if [[ -z "$version" ]]; then
    echo "resolve_homebrew_coreutils_version: couldn't parse a version out of $formula_url" >&2
    return 1
  fi
  echo "$version"
}
