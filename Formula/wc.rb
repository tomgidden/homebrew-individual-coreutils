class Wc < Formula
  desc "GNU coreutils' wc, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-wc-9.11-arm64-apple-darwin.tar.gz"
      sha256 "8e9243e0ffe14c3e1e5230cac7410ad2aa169ce6d6061caf4b64440aed59c536"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-wc-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "2fdb178f201456a997decdf17ae6ea5227b78dfec634625bf112bf96624941a6"
    end
  end

  def install
    bin.install "bin/gwc"
    man1.install "share/man/man1/gwc.1" if File.exist?("share/man/man1/gwc.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "wc" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gwc" => "wc" unless which("wc")
  end

  test do
    system "#{bin}/gwc", "--version"
  end
end
