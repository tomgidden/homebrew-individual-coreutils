class Stat < Formula
  desc "GNU coreutils' stat, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-stat-9.11-arm64-apple-darwin.tar.gz"
      sha256 "240ce1f9ded29a2313274de0130c265e422b8c896421ffcf83e028bb8229b667"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-stat-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "6637afcb14c32e5a09389c3f7d9f165f64a2bd51845cf7e19d3d3d0faf5d5751"
    end
  end

  def install
    bin.install "bin/gstat"
    man1.install "share/man/man1/gstat.1" if File.exist?("share/man/man1/gstat.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "stat" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gstat" => "stat" unless which("stat")
  end

  test do
    system "#{bin}/gstat", "--version"
  end
end
