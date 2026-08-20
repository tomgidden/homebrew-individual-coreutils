class Base32 < Formula
  desc "GNU coreutils' base32, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-base32-9.11-arm64-apple-darwin.tar.gz"
      sha256 "ad48537d7929b73c825cf563e23d0e0a1f5e98fb1fcfd8093c180af90ee51c78"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-base32-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "1afc3b893317672bb2f2b97dde92066f41835d7ae230693902c4ac8ed4430c24"
    end
  end

  def install
    bin.install "bin/gbase32"
    man1.install "share/man/man1/gbase32.1" if File.exist?("share/man/man1/gbase32.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "base32" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gbase32" => "base32" unless which("base32")
  end

  test do
    system "#{bin}/gbase32", "--version"
  end
end
