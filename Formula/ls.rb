class Ls < Formula
  desc "GNU coreutils' ls, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-ls-9.11-arm64-apple-darwin.tar.gz"
      sha256 "a001e3f2243f91bd1bdb39d5c31ab0718f30a151c10f6ee4ba6a2211ff3efe21"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-ls-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "d339defbde387347c5e3ee66720803b3a18775f167b8eb3c54b74cfe850b05c4"
    end
  end

  def install
    bin.install "bin/gls"
    man1.install "share/man/man1/gls.1" if File.exist?("share/man/man1/gls.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "ls" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gls" => "ls" unless which("ls")
  end

  test do
    system "#{bin}/gls", "--version"
  end
end
