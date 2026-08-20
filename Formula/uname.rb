class Uname < Formula
  desc "GNU coreutils' uname, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-uname-9.11-arm64-apple-darwin.tar.gz"
      sha256 "83e728ed30224a01c6de0f33db4073148341e8b9ff15d5dc0fc4204ae27d66e9"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-uname-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "d955838270780b5d918e13ccba6747ffe9fd178cf312e8c44d8fcee22c6885c4"
    end
  end

  def install
    bin.install "bin/guname"
    man1.install "share/man/man1/guname.1" if File.exist?("share/man/man1/guname.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "uname" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "guname" => "uname" unless which("uname")
  end

  test do
    system "#{bin}/guname", "--version"
  end
end
