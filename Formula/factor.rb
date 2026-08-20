class Factor < Formula
  desc "GNU coreutils' factor, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-factor-9.11-arm64-apple-darwin.tar.gz"
      sha256 "ceba77bf8987cc7377e1a1a0093722b700a6ad8948f9ef8c6e7aa81e1061769c"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-factor-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "58707e2f60d27043e45696e5894583397cc90fde49a43d6bd3816ab70153d084"
    end
  end

  def install
    bin.install "bin/gfactor"
    man1.install "share/man/man1/gfactor.1" if File.exist?("share/man/man1/gfactor.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "factor" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gfactor" => "factor" unless which("factor")
  end

  test do
    system "#{bin}/gfactor", "--version"
  end
end
