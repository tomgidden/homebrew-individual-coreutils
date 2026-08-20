class Shuf < Formula
  desc "GNU coreutils' shuf, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-shuf-9.11-arm64-apple-darwin.tar.gz"
      sha256 "81fac8bcf16b1e850f2553f7de789e3cbdffa81580cc0548c77577ea4bd91853"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-shuf-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "23b7174a33208adec3749f36a084fc53887a645d38a49d4838b6daa1eb823ee5"
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
