class Chmod < Formula
  desc "GNU coreutils' chmod, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-chmod-9.11-arm64-apple-darwin.tar.gz"
      sha256 "7c2d94f9da5344302f32082623ae5c6f16772cf0c77c335a03577d6f2381774f"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-chmod-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "81988636bb080038198e721da0ee340beabed13914de3dba55dc72c80917cf0d"
    end
  end

  def install
    bin.install "bin/gchmod"
    man1.install "share/man/man1/gchmod.1" if File.exist?("share/man/man1/gchmod.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "chmod" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gchmod" => "chmod" unless which("chmod")
  end

  test do
    system "#{bin}/gchmod", "--version"
  end
end
