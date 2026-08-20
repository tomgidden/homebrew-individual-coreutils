class Tee < Formula
  desc "GNU coreutils' tee, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tee-9.11-arm64-apple-darwin.tar.gz"
      sha256 "8e4324edefa9270c767ddaed1b8b441e2c6c127a3e3ba25a0c2729fab1819d46"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tee-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "ced2ed6531a8871fac0cef36b5eedd873b8c0f9a44aba69b0e69c6c8d867461a"
    end
  end

  def install
    bin.install "bin/gtee"
    man1.install "share/man/man1/gtee.1" if File.exist?("share/man/man1/gtee.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "tee" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtee" => "tee" unless which("tee")
  end

  test do
    system "#{bin}/gtee", "--version"
  end
end
