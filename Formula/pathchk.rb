class Pathchk < Formula
  desc "GNU coreutils' pathchk, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-pathchk-9.11-arm64-apple-darwin.tar.gz"
      sha256 "94f88462bd10be8b2b6df82ee7d533d6b6605fee20273584644307f710cf29f4"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-pathchk-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "bf2ce6646211639d5c87c42bc0082bf5e57016659b1d800325281a89432dc635"
    end
  end

  def install
    bin.install "bin/gpathchk"
    man1.install "share/man/man1/gpathchk.1" if File.exist?("share/man/man1/gpathchk.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "pathchk" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gpathchk" => "pathchk" unless which("pathchk")
  end

  test do
    system "#{bin}/gpathchk", "--version"
  end
end
