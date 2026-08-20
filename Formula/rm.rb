class Rm < Formula
  desc "GNU coreutils' rm, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-rm-9.11-arm64-apple-darwin.tar.gz"
      sha256 "a3c63f8710146a8964705f6e4ef52c19181b461db7d90740872783a0485dcc55"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-rm-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "59b3e75d8927e488ee3bd8d00f1937f0740bd1f5dfc61ea5e8601757f2077dbc"
    end
  end

  def install
    bin.install "bin/grm"
    man1.install "share/man/man1/grm.1" if File.exist?("share/man/man1/grm.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "rm" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "grm" => "rm" unless which("rm")
  end

  test do
    system "#{bin}/grm", "--version"
  end
end
