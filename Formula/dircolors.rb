class Dircolors < Formula
  desc "GNU coreutils' dircolors, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-dircolors-9.11-arm64-apple-darwin.tar.gz"
      sha256 "49344a387e8bfe0572378f4c6bf037f965eccdc47f4d16fb6d0c7922bc4aba05"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-dircolors-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "ba6d67e85c6ec3bebda5cef886cb74a99b2c45e367035f1a8ae652a5c4780f9e"
    end
  end

  def install
    bin.install "bin/gdircolors"
    man1.install "share/man/man1/gdircolors.1" if File.exist?("share/man/man1/gdircolors.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "dircolors" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gdircolors" => "dircolors" unless which("dircolors")
  end

  test do
    system "#{bin}/gdircolors", "--version"
  end
end
