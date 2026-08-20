class Tail < Formula
  desc "GNU coreutils' tail, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tail-9.11-arm64-apple-darwin.tar.gz"
      sha256 "5a991ac230694421f78ef51ee64063a1309f3954651adec5307e0b59f8f968a6"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tail-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "75660a43c588558073501b6b408b400be2cc0b469ebcc3171e342485dfa16d94"
    end
  end

  def install
    bin.install "bin/gtail"
    man1.install "share/man/man1/gtail.1" if File.exist?("share/man/man1/gtail.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "tail" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtail" => "tail" unless which("tail")
  end

  test do
    system "#{bin}/gtail", "--version"
  end
end
