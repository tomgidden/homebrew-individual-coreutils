class Tsort < Formula
  desc "GNU coreutils' tsort, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tsort-9.11-arm64-apple-darwin.tar.gz"
      sha256 "c0ddd4b0ab15f16577a1d85cb3baea06466023bf507b5fdc66e680ef9a8dfa98"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tsort-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "245d0dd7a535441ae281dc099a60df3654d3e41ab9a3bb74d20b5901f5760d81"
    end
  end

  def install
    bin.install "bin/gtsort"
    man1.install "share/man/man1/gtsort.1" if File.exist?("share/man/man1/gtsort.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "tsort" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtsort" => "tsort" unless which("tsort")
  end

  test do
    system "#{bin}/gtsort", "--version"
  end
end
