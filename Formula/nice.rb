class Nice < Formula
  desc "GNU coreutils' nice, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-nice-9.11-arm64-apple-darwin.tar.gz"
      sha256 "d313cfb3dd0316094b65634600aa06e10a04f10948024a2d98098f2de8586b96"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-nice-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "4b0114fcef62661afe583887db5f92b7c818be654cb6675b4ec9bf1ec8b115d3"
    end
  end

  def install
    bin.install "bin/gnice"
    man1.install "share/man/man1/gnice.1" if File.exist?("share/man/man1/gnice.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "nice" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gnice" => "nice" unless which("nice")
  end

  test do
    system "#{bin}/gnice", "--version"
  end
end
