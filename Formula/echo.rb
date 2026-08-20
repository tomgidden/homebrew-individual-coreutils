class Echo < Formula
  desc "GNU coreutils' echo, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-echo-9.11-arm64-apple-darwin.tar.gz"
      sha256 "44797ac34444f959be1f9d87885e33c99aeca968c1f0e67d06a6da49a483a135"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-echo-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "a7caaedf02c32aac46a1c8cc9d60740aec05417e6b9cb5380121c2cce5459f25"
    end
  end

  def install
    bin.install "bin/gecho"
    man1.install "share/man/man1/gecho.1" if File.exist?("share/man/man1/gecho.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "echo" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gecho" => "echo" unless which("echo")
  end

  test do
    system "#{bin}/gecho", "--version"
  end
end
