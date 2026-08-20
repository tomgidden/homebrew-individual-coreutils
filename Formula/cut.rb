class Cut < Formula
  desc "GNU coreutils' cut, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-cut-9.11-arm64-apple-darwin.tar.gz"
      sha256 "2c2b2b44de1ff06926bdd49c2c431c9555ea715a8f4812ab22dd0134761d63b4"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-cut-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "cd69e0fc34a22f817d29e48f9b0c549c6e395755b132dade3755c8e6557a2d52"
    end
  end

  def install
    bin.install "bin/gcut"
    man1.install "share/man/man1/gcut.1" if File.exist?("share/man/man1/gcut.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "cut" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gcut" => "cut" unless which("cut")
  end

  test do
    system "#{bin}/gcut", "--version"
  end
end
