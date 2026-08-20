class Vdir < Formula
  desc "GNU coreutils' vdir, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-vdir-9.11-arm64-apple-darwin.tar.gz"
      sha256 "739cfe28d16ba3f36c8857cf03f1cae7c7cbdfa07085df27d7ae8804b8014b1f"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-vdir-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "e1db07485fa71c33a207528304f28f087dafad0bfb9571f7da9b948416f959ec"
    end
  end

  def install
    bin.install "bin/gvdir"
    man1.install "share/man/man1/gvdir.1" if File.exist?("share/man/man1/gvdir.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "vdir" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gvdir" => "vdir" unless which("vdir")
  end

  test do
    system "#{bin}/gvdir", "--version"
  end
end
