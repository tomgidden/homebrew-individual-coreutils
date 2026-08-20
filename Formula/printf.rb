class Printf < Formula
  desc "GNU coreutils' printf, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-printf-9.11-arm64-apple-darwin.tar.gz"
      sha256 "70b61b97b43cbd823077c0cdc5731786eba77049a4bb298afe3debe831c10b83"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-printf-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "10603b7e2c3808d0abf9ba53d789ed361f1964a53a9a3315919983609dd1948b"
    end
  end

  def install
    bin.install "bin/gprintf"
    man1.install "share/man/man1/gprintf.1" if File.exist?("share/man/man1/gprintf.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "printf" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gprintf" => "printf" unless which("printf")
  end

  test do
    system "#{bin}/gprintf", "--version"
  end
end
