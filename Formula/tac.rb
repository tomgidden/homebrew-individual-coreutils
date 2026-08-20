class Tac < Formula
  desc "GNU coreutils' tac, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tac-9.11-arm64-apple-darwin.tar.gz"
      sha256 "36a50a65a2a50412eb96adf81df5d56df50032b56e464be86f6bc8407f0962b9"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tac-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "855bce66cdebbad8aef3c073aa3ecc1d9e926765a223231976b14614f354f5c0"
    end
  end

  def install
    bin.install "bin/gtac"
    man1.install "share/man/man1/gtac.1" if File.exist?("share/man/man1/gtac.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "tac" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtac" => "tac" unless which("tac")
  end

  test do
    system "#{bin}/gtac", "--version"
  end
end
