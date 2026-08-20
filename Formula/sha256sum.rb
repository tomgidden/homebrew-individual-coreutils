class Sha256sum < Formula
  desc "GNU coreutils' sha256sum, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sha256sum-9.11-arm64-apple-darwin.tar.gz"
      sha256 "5f620606985901eac6e1aa5866f03e2312c7c9749bc5f1da13c36664a08acaa2"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sha256sum-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "e9cf2360fd7d9bc060ad898ab262ba01b5f27c35d833899d0397d7bb73f6dc2d"
    end
  end

  def install
    bin.install "bin/gsha256sum"
    man1.install "share/man/man1/gsha256sum.1" if File.exist?("share/man/man1/gsha256sum.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "sha256sum" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gsha256sum" => "sha256sum" unless which("sha256sum")
  end

  test do
    system "#{bin}/gsha256sum", "--version"
  end
end
