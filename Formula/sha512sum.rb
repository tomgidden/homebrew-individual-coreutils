class Sha512sum < Formula
  desc "GNU coreutils' sha512sum, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sha512sum-9.11-arm64-apple-darwin.tar.gz"
      sha256 "a8584d17e0b24da57f2d82efb1224495b92edaa54630edbac1b8b540114fdc7b"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sha512sum-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "cd1cb7fb74472d48fe53ea7d8afe06d23f1f4d36cfdc844850afef835973c17b"
    end
  end

  def install
    bin.install "bin/gsha512sum"
    man1.install "share/man/man1/gsha512sum.1" if File.exist?("share/man/man1/gsha512sum.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "sha512sum" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gsha512sum" => "sha512sum" unless which("sha512sum")
  end

  test do
    system "#{bin}/gsha512sum", "--version"
  end
end
