class Sha1sum < Formula
  desc "GNU coreutils' sha1sum, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sha1sum-9.11-arm64-apple-darwin.tar.gz"
      sha256 "68faa5713daa8a64fa8ea3c441425ffff6299fe0d32641cabaaa5c28eb70f7d4"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sha1sum-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "7576bbc657bebbdd810096bac4c0f2d9002ffb1122d7cd12270897ee0e9b6f68"
    end
  end

  def install
    bin.install "bin/gsha1sum"
    man1.install "share/man/man1/gsha1sum.1" if File.exist?("share/man/man1/gsha1sum.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "sha1sum" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gsha1sum" => "sha1sum" unless which("sha1sum")
  end

  test do
    system "#{bin}/gsha1sum", "--version"
  end
end
