class Dd < Formula
  desc "GNU coreutils' dd, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-dd-9.11-arm64-apple-darwin.tar.gz"
      sha256 "c4ab1304b4029c2213ef9e881bfab2a7891c39529044951b0b515c854216cc31"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-dd-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "65f8d6a0ce657377738e2a5f7a86ca5c0cef2399a54782c1690d983e8aad7214"
    end
  end

  def install
    bin.install "bin/gdd"
    man1.install "share/man/man1/gdd.1" if File.exist?("share/man/man1/gdd.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "dd" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gdd" => "dd" unless which("dd")
  end

  test do
    system "#{bin}/gdd", "--version"
  end
end
