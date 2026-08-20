class Mktemp < Formula
  desc "GNU coreutils' mktemp, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-mktemp-9.11-arm64-apple-darwin.tar.gz"
      sha256 "cf1ec82877d0d63fc01a87f63d31aaec5133d931b311dd51870e1b2fcfdb8c44"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-mktemp-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "2b25fb5b39e72eb8849a29edf180055fc0b55be20681d104454fc93959386eb5"
    end
  end

  def install
    bin.install "bin/gmktemp"
    man1.install "share/man/man1/gmktemp.1" if File.exist?("share/man/man1/gmktemp.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "mktemp" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gmktemp" => "mktemp" unless which("mktemp")
  end

  test do
    system "#{bin}/gmktemp", "--version"
  end
end
