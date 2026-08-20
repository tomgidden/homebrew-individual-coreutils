class Head < Formula
  desc "GNU coreutils' head, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-head-9.11-arm64-apple-darwin.tar.gz"
      sha256 "8d18828a6cf142a2a0946904dd8017caf72c9682a5cac8e18b80f060aaf9343c"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-head-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "143d951191e4fb278d017c5317bd33577ae173d01e2d69a72078ee5cd4fd8a22"
    end
  end

  def install
    bin.install "bin/ghead"
    man1.install "share/man/man1/ghead.1" if File.exist?("share/man/man1/ghead.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "head" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "ghead" => "head" unless which("head")
  end

  test do
    system "#{bin}/ghead", "--version"
  end
end
