class Sort < Formula
  desc "GNU coreutils' sort, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sort-9.11-arm64-apple-darwin.tar.gz"
      sha256 "1075a1d83076b7453497b0d2ca289ece96fc3c0feee7814cc54eb4031bfdc2c4"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sort-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "cf070f0a43477c1bc3b4492cd062021d1defe8b04f0037e364eb94fdb772b9ab"
    end
  end

  def install
    bin.install "bin/gsort"
    man1.install "share/man/man1/gsort.1" if File.exist?("share/man/man1/gsort.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "sort" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gsort" => "sort" unless which("sort")
  end

  test do
    system "#{bin}/gsort", "--version"
  end
end
