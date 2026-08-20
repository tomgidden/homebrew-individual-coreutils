class Tty < Formula
  desc "GNU coreutils' tty, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tty-9.11-arm64-apple-darwin.tar.gz"
      sha256 "5e3e9ae268e310fa2f3fe20c4d3b8cc3ecf53e74844c39dc4a74fb749dd99eea"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tty-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "d127888f415d8f3feff45805c2190b4a60804351bd05796455e557df59cc6d57"
    end
  end

  def install
    bin.install "bin/gtty"
    man1.install "share/man/man1/gtty.1" if File.exist?("share/man/man1/gtty.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "tty" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtty" => "tty" unless which("tty")
  end

  test do
    system "#{bin}/gtty", "--version"
  end
end
