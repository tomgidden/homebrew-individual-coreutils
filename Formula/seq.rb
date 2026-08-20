class Seq < Formula
  desc "GNU coreutils' seq, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-seq-9.11-arm64-apple-darwin.tar.gz"
      sha256 "1c98b75097d0520bdac9099dd55f1041943d537f1545733aa517980a69b9d0ec"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-seq-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "6140db4e9b5e5092c03710b2e7714f75f64fcd6e84bc6feedef6b0e7f6311007"
    end
  end

  def install
    bin.install "bin/gseq"
    man1.install "share/man/man1/gseq.1" if File.exist?("share/man/man1/gseq.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "seq" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gseq" => "seq" unless which("seq")
  end

  test do
    system "#{bin}/gseq", "--version"
  end
end
