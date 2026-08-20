class Sum < Formula
  desc "GNU coreutils' sum, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sum-9.11-arm64-apple-darwin.tar.gz"
      sha256 "302083f56e44e3c2b6b9fef78917d5dbe8921b72713dee24f8ac77de34c0bd45"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sum-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "c56bc3a56fc9bf54a367a57e297099581102e95800c7d8b1f817585282c7fc90"
    end
  end

  def install
    bin.install "bin/gsum"
    man1.install "share/man/man1/gsum.1" if File.exist?("share/man/man1/gsum.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "sum" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gsum" => "sum" unless which("sum")
  end

  test do
    system "#{bin}/gsum", "--version"
  end
end
