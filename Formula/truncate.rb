class Truncate < Formula
  desc "GNU coreutils' truncate, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-truncate-9.11-arm64-apple-darwin.tar.gz"
      sha256 "21b474f4b77f6af56368be905d62ddda5bf9c39468a7e976e7f004a20a5d00ad"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-truncate-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "0304bd3454d4c6b4cb71bfad317df82279530f4099501fa40c80dcb13999b1e4"
    end
  end

  def install
    bin.install "bin/gtruncate"
    man1.install "share/man/man1/gtruncate.1" if File.exist?("share/man/man1/gtruncate.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "truncate" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtruncate" => "truncate" unless which("truncate")
  end

  test do
    system "#{bin}/gtruncate", "--version"
  end
end
