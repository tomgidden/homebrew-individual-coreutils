class Nproc < Formula
  desc "GNU coreutils' nproc, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-nproc-9.11-arm64-apple-darwin.tar.gz"
      sha256 "8a6c09132edd62da873721da0aff3fe6d98c7455a62e0315a7078ec65895ff46"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-nproc-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "faa3f3bc03c84cbbf6c74b5175759e62a688a08cc7d64538eb816a1520d8a4a9"
    end
  end

  def install
    bin.install "bin/gnproc"
    man1.install "share/man/man1/gnproc.1" if File.exist?("share/man/man1/gnproc.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "nproc" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gnproc" => "nproc" unless which("nproc")
  end

  test do
    system "#{bin}/gnproc", "--version"
  end
end
