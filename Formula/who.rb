class Who < Formula
  desc "GNU coreutils' who, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-who-9.11-arm64-apple-darwin.tar.gz"
      sha256 "6383054506ca369ad343e04991ac3c10d27fd10040d23336ec13aeb5b6b9d7f7"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-who-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "5aed5312a7d25e35cc4929fe6139ed0794af9950b3a36982884ec5974642cd19"
    end
  end

  def install
    bin.install "bin/gwho"
    man1.install "share/man/man1/gwho.1" if File.exist?("share/man/man1/gwho.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "who" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gwho" => "who" unless which("who")
  end

  test do
    system "#{bin}/gwho", "--version"
  end
end
