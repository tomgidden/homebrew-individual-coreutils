class B2sum < Formula
  desc "GNU coreutils' b2sum, standalone (no macOS equivalent exists)"
  homepage "https://github.com/tomgidden/individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-b2sum-9.11-arm64-apple-darwin.tar.gz"
      sha256 "f3127d407882d0efb5e63a5c6eaa9c35a6e01b13fb861d60bd7bc1d98580b898"
    end
    on_intel do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-b2sum-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "744faeaadd1e4f02f21c216b42cdbb5abd2fdd64afdf3137d56024b3740e2598"
    end
  end

  def install
    bin.install "bin/gb2sum"
    man1.install "share/man/man1/gb2sum.1" if File.exist?("share/man/man1/gb2sum.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "b2sum" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gb2sum" => "b2sum" unless which("b2sum")
  end

  test do
    system "#{bin}/gb2sum", "--version"
  end
end
