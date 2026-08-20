class Mkfifo < Formula
  desc "GNU coreutils' mkfifo, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-mkfifo-9.11-arm64-apple-darwin.tar.gz"
      sha256 "c12519bfb5e2d8378ccf1c86a72d15404144cf87d380a69f933809bdc8d1a91d"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-mkfifo-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "5a708c07aa06f78264e544f867392e89aa84e68066c7864cce0373d4b546ca64"
    end
  end

  def install
    bin.install "bin/gmkfifo"
    man1.install "share/man/man1/gmkfifo.1" if File.exist?("share/man/man1/gmkfifo.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "mkfifo" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gmkfifo" => "mkfifo" unless which("mkfifo")
  end

  test do
    system "#{bin}/gmkfifo", "--version"
  end
end
