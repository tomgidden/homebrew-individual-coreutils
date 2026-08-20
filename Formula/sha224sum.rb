class Sha224sum < Formula
  desc "GNU coreutils' sha224sum, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sha224sum-9.11-arm64-apple-darwin.tar.gz"
      sha256 "6f226950119e60ee2d003f92fecb473c3ef6f4ce30b236f80fe067e3faf3b2e5"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sha224sum-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "4f35180c486d1b611b184eed7c4a773d4aeaee09719d71151ffa39929321e6c3"
    end
  end

  def install
    bin.install "bin/gsha224sum"
    man1.install "share/man/man1/gsha224sum.1" if File.exist?("share/man/man1/gsha224sum.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "sha224sum" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gsha224sum" => "sha224sum" unless which("sha224sum")
  end

  test do
    system "#{bin}/gsha224sum", "--version"
  end
end
