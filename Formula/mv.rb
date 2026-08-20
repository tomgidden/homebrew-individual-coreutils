class Mv < Formula
  desc "GNU coreutils' mv, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-mv-9.11-arm64-apple-darwin.tar.gz"
      sha256 "6ac26affe736db1721f7b55b67c1bfb5e75c7f2994a95197d9e426861904ae90"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-mv-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "53fed98615ddfac4240ef31c36cd05cf9db02adc38ddfd045d1926c82fa7e00a"
    end
  end

  def install
    bin.install "bin/gmv"
    man1.install "share/man/man1/gmv.1" if File.exist?("share/man/man1/gmv.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "mv" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gmv" => "mv" unless which("mv")
  end

  test do
    system "#{bin}/gmv", "--version"
  end
end
