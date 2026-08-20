class Split < Formula
  desc "GNU coreutils' split, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-split-9.11-arm64-apple-darwin.tar.gz"
      sha256 "4b7fbcf2ed1d70f00de7a0b8edb080a25fe6720a05321c6b09c00dd87d11baf9"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-split-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "1e09c9f1cfe8eceb004dd7ecc9592e4a9c8ba7b1c4357f2d5854bf649cb94710"
    end
  end

  def install
    bin.install "bin/gsplit"
    man1.install "share/man/man1/gsplit.1" if File.exist?("share/man/man1/gsplit.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "split" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gsplit" => "split" unless which("split")
  end

  test do
    system "#{bin}/gsplit", "--version"
  end
end
