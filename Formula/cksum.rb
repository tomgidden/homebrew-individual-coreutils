class Cksum < Formula
  desc "GNU coreutils' cksum, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-cksum-9.11-arm64-apple-darwin.tar.gz"
      sha256 "2c2abf1d040f5a6bb84613b7651fa06be18656dd47c8a0419a708ae44e91dda0"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-cksum-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "2b6c74b78c6add4a6cf01c559465dd8d8f2e2c7fbd6a54185dd673b9bfb52751"
    end
  end

  def install
    bin.install "bin/gcksum"
    man1.install "share/man/man1/gcksum.1" if File.exist?("share/man/man1/gcksum.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "cksum" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gcksum" => "cksum" unless which("cksum")
  end

  test do
    system "#{bin}/gcksum", "--version"
  end
end
