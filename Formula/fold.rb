class Fold < Formula
  desc "GNU coreutils' fold, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-fold-9.11-arm64-apple-darwin.tar.gz"
      sha256 "8e3c5412bb9170278e03c494a1e592a7fb076fdd7d39b4226f87f466b8333d49"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-fold-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "c97735e4dc455a7c8780ed52e55ec05acc969f83a92d3cd9c325048bdb60e401"
    end
  end

  def install
    bin.install "bin/gfold"
    man1.install "share/man/man1/gfold.1" if File.exist?("share/man/man1/gfold.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "fold" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gfold" => "fold" unless which("fold")
  end

  test do
    system "#{bin}/gfold", "--version"
  end
end
