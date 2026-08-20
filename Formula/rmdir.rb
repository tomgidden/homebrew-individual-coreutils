class Rmdir < Formula
  desc "GNU coreutils' rmdir, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-rmdir-9.11-arm64-apple-darwin.tar.gz"
      sha256 "6011178d7b4d92b23b0c207c705079e57d7d4f848306685699f90eb32c245214"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-rmdir-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "b260473d3a84d8003923f22aaef86a897e942eab150445606f49e8c0e067b3b6"
    end
  end

  def install
    bin.install "bin/grmdir"
    man1.install "share/man/man1/grmdir.1" if File.exist?("share/man/man1/grmdir.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "rmdir" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "grmdir" => "rmdir" unless which("rmdir")
  end

  test do
    system "#{bin}/grmdir", "--version"
  end
end
