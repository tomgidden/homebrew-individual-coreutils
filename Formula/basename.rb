class Basename < Formula
  desc "GNU coreutils' basename, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-basename-9.11-arm64-apple-darwin.tar.gz"
      sha256 "8c4e229f365fd31b9ce0bc84d5767dc667c1b86d32fe061baa0679f83e3c4984"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-basename-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "fab8867a42c80fe8699c234ce43af7c9b9c03202bb4c34dd0e3fd9d151f11b4d"
    end
  end

  def install
    bin.install "bin/gbasename"
    man1.install "share/man/man1/gbasename.1" if File.exist?("share/man/man1/gbasename.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "basename" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gbasename" => "basename" unless which("basename")
  end

  test do
    system "#{bin}/gbasename", "--version"
  end
end
