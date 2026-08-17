class Base32 < Formula
  desc "GNU coreutils' base32, standalone (no macOS equivalent exists)"
  homepage "https://github.com/tomgidden/individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-base32-9.11-arm64-apple-darwin.tar.gz"
      sha256 "ac5d83741fa402a8d98f1e991671c9cbb1765000226e12add31c4135eef1157e"
    end
    on_intel do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-base32-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "fd96498c5e513beae3b12baa9937e963ec3f033e58d4890e173c99d6398e7dbd"
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
