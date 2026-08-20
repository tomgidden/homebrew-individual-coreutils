class Whoami < Formula
  desc "GNU coreutils' whoami, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-whoami-9.11-arm64-apple-darwin.tar.gz"
      sha256 "c6a83d1891409864e4a184cdfda7c769444e7cf23acdd93494521763d0e762ab"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-whoami-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "0a842012c8921090ba07243aec4f3310699d411bb9ee7b58bfd0470544fef4d9"
    end
  end

  def install
    bin.install "bin/gwhoami"
    man1.install "share/man/man1/gwhoami.1" if File.exist?("share/man/man1/gwhoami.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "whoami" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gwhoami" => "whoami" unless which("whoami")
  end

  test do
    system "#{bin}/gwhoami", "--version"
  end
end
