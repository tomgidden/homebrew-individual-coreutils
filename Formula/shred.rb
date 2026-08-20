class Shred < Formula
  desc "GNU coreutils' shred, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-shred-9.11-arm64-apple-darwin.tar.gz"
      sha256 "bf090685ca958a007dead00f1cd7bcc8bcf9671ad7f55060f843457f31de99fe"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-shred-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "9bea48f8ae349eb3df8e103a500a7da4bfb909ebe3936b71750f0d0b008c05b7"
    end
  end

  def install
    bin.install "bin/gshred"
    man1.install "share/man/man1/gshred.1" if File.exist?("share/man/man1/gshred.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "shred" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gshred" => "shred" unless which("shred")
  end

  test do
    system "#{bin}/gshred", "--version"
  end
end
