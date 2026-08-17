class Shred < Formula
  desc "GNU coreutils' shred, standalone (no macOS equivalent exists)"
  homepage "https://github.com/tomgidden/individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-shred-9.11-arm64-apple-darwin.tar.gz"
      sha256 "eaf78379767292d376fd9c51a3c18181b2db7e0e1137923934ebf5626fe83b17"
    end
    on_intel do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-shred-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "15d5f4a8da13a68650ee9dda2b6b901275a33cb1997b134128ae1d766925b67e"
    end
  end

  def install
    bin.install "bin/gshred"
    man1.install "share/man/man1/gshred.1" if File.exist?("share/man/man1/gshred.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "shred" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gshred" => "shred" unless which("shred")
  end

  test do
    system "#{bin}/gshred", "--version"
  end
end
