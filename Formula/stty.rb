class Stty < Formula
  desc "GNU coreutils' stty, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-stty-9.11-arm64-apple-darwin.tar.gz"
      sha256 "12aa0785ad9bd3fb3a8cd02941aa5880cf3fb80ac016b4adc38420fc81c932a1"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-stty-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "1768472e32ce7c30c1b974f40f5b465861a56fb94f4fd671f4b0c7e25dfbccc6"
    end
  end

  def install
    bin.install "bin/gstty"
    man1.install "share/man/man1/gstty.1" if File.exist?("share/man/man1/gstty.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "stty" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gstty" => "stty" unless which("stty")
  end

  test do
    system "#{bin}/gstty", "--version"
  end
end
