class Shuf < Formula
  desc "GNU coreutils' shuf, standalone (no macOS equivalent exists)"
  homepage "https://github.com/tomgidden/individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-shuf-9.11-arm64-apple-darwin.tar.gz"
      sha256 "2c9c49330ddcc4b374ddc5ff9ac58da970a1e96c66d0862b0ae2fd5be70392fc"
    end
    on_intel do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-shuf-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "d18c906e559f99aa5da884d3f46f1fc36745c5a98a831b953f66aa43146ad97c"
    end
  end

  def install
    bin.install "bin/gshuf"
    man1.install "share/man/man1/gshuf.1" if File.exist?("share/man/man1/gshuf.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "shuf" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gshuf" => "shuf" unless which("shuf")
  end

  test do
    system "#{bin}/gshuf", "--version"
  end
end
