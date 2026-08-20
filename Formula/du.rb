class Du < Formula
  desc "GNU coreutils' du, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-du-9.11-arm64-apple-darwin.tar.gz"
      sha256 "b00e947fc27eed3a617b3f4ccb9e45da988eeada75e14964ea195679ea6b7a71"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-du-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "ac8b6dccd57db4c7f9b3ef6077c4d93139306abfa7fe9229adcb0ee293c82431"
    end
  end

  def install
    bin.install "bin/gdu"
    man1.install "share/man/man1/gdu.1" if File.exist?("share/man/man1/gdu.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "du" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gdu" => "du" unless which("du")
  end

  test do
    system "#{bin}/gdu", "--version"
  end
end
