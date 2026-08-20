class Expr < Formula
  desc "GNU coreutils' expr, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-expr-9.11-arm64-apple-darwin.tar.gz"
      sha256 "796dcbe5edbcdca8312576d5be01ca32f3aec3ce3fcfa459ae6b2042a489f154"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-expr-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "26abe52089db8a1f6fa5294de4ac2eb0430baa36eba06ca74560828ed38b6316"
    end
  end

  def install
    bin.install "bin/gexpr"
    man1.install "share/man/man1/gexpr.1" if File.exist?("share/man/man1/gexpr.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "expr" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gexpr" => "expr" unless which("expr")
  end

  test do
    system "#{bin}/gexpr", "--version"
  end
end
