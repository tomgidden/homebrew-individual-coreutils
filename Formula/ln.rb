class Ln < Formula
  desc "GNU coreutils' ln, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-ln-9.11-arm64-apple-darwin.tar.gz"
      sha256 "ae0d4549eb09fb59b69844d03e6a569853ae929357724afc727386fbd45eafbb"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-ln-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "bfc12426c7105fe91eb8e41bb56eec0b6c4b7741bfc5f1476582b45b06f1f597"
    end
  end

  def install
    bin.install "bin/gln"
    man1.install "share/man/man1/gln.1" if File.exist?("share/man/man1/gln.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "ln" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gln" => "ln" unless which("ln")
  end

  test do
    system "#{bin}/gln", "--version"
  end
end
