class Mknod < Formula
  desc "GNU coreutils' mknod, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-mknod-9.11-arm64-apple-darwin.tar.gz"
      sha256 "9aa9631def29f71bf9d3d5a5c22800511bcbc8fd56b761925848a3837041cd4a"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-mknod-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "00b5b896283e18942d53900f1f982a8f4c901c170048c4472ba5d201de999603"
    end
  end

  def install
    bin.install "bin/gmknod"
    man1.install "share/man/man1/gmknod.1" if File.exist?("share/man/man1/gmknod.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "mknod" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gmknod" => "mknod" unless which("mknod")
  end

  test do
    system "#{bin}/gmknod", "--version"
  end
end
