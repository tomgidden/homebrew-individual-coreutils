class Dir < Formula
  desc "GNU coreutils' dir, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-dir-9.11-arm64-apple-darwin.tar.gz"
      sha256 "b7b521c7799a65904e1832979ca179d25ea843ece2dcc522b4d88085269711b0"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-dir-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "e04a0c65948f42338e45430bd87ab45f708669261d9a1e54923677ff6163b5ab"
    end
  end

  def install
    bin.install "bin/gdir"
    man1.install "share/man/man1/gdir.1" if File.exist?("share/man/man1/gdir.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "dir" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gdir" => "dir" unless which("dir")
  end

  test do
    system "#{bin}/gdir", "--version"
  end
end
