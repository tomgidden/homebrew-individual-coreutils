class Sha384sum < Formula
  desc "GNU coreutils' sha384sum, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sha384sum-9.11-arm64-apple-darwin.tar.gz"
      sha256 "b3c3d3b9a46e3c4a73f2b9c5e507b7c216928975a8f407f3a54e2243259aa939"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sha384sum-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "ad62a5ce8cfa2769d8f5022205b02afe43182d0a18e23a80ede55db44e2d3630"
    end
  end

  def install
    bin.install "bin/gsha384sum"
    man1.install "share/man/man1/gsha384sum.1" if File.exist?("share/man/man1/gsha384sum.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "sha384sum" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gsha384sum" => "sha384sum" unless which("sha384sum")
  end

  test do
    system "#{bin}/gsha384sum", "--version"
  end
end
