class Ptx < Formula
  desc "GNU coreutils' ptx, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-ptx-9.11-arm64-apple-darwin.tar.gz"
      sha256 "ff2de9499196ee64af5d0877a55fe80a77aa7d15388b72b1a76ef5b81ddd14ff"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-ptx-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "36289448e0f7339eb7badf1e49a37fc6e992fef64498c7e26f4a7a8cfc0587bc"
    end
  end

  def install
    bin.install "bin/gptx"
    man1.install "share/man/man1/gptx.1" if File.exist?("share/man/man1/gptx.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "ptx" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gptx" => "ptx" unless which("ptx")
  end

  test do
    system "#{bin}/gptx", "--version"
  end
end
