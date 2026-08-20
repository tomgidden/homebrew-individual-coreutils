class Numfmt < Formula
  desc "GNU coreutils' numfmt, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-numfmt-9.11-arm64-apple-darwin.tar.gz"
      sha256 "9a56ba6d236ca78b7aeaa12b6454005ef33deb0e27663b62ea9e0440f2eb2c9d"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-numfmt-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "61abf5610ac2513b8aedacf1866a18194bc32536f04155f767901c277c5973ce"
    end
  end

  def install
    bin.install "bin/gnumfmt"
    man1.install "share/man/man1/gnumfmt.1" if File.exist?("share/man/man1/gnumfmt.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "numfmt" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gnumfmt" => "numfmt" unless which("numfmt")
  end

  test do
    system "#{bin}/gnumfmt", "--version"
  end
end
