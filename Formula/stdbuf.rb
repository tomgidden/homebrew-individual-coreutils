class Stdbuf < Formula
  desc "GNU coreutils' stdbuf, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-stdbuf-9.11-arm64-apple-darwin.tar.gz"
      sha256 "c0e4060e8f9359607b84f3a016020001f4941dbcece09e234b33a9a3af9e1983"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-stdbuf-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "2589d0b30e772667207229f66cd45573b02bf5b236f25a99934092edd234bd7c"
    end
  end

  def install
    bin.install "bin/gstdbuf"
    man1.install "share/man/man1/gstdbuf.1" if File.exist?("share/man/man1/gstdbuf.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "stdbuf" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gstdbuf" => "stdbuf" unless which("stdbuf")
  end

  test do
    system "#{bin}/gstdbuf", "--version"
  end
end
