class Join < Formula
  desc "GNU coreutils' join, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-join-9.11-arm64-apple-darwin.tar.gz"
      sha256 "f54eb0fedf5ea55302848922d44c71c6e1dea9c421d25ef33d91fad18107fae1"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-join-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "8e80a645bf6979f00b622acb962cd1c1d0397478f0ba0c5cef18094cdd812d05"
    end
  end

  def install
    bin.install "bin/gjoin"
    man1.install "share/man/man1/gjoin.1" if File.exist?("share/man/man1/gjoin.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "join" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gjoin" => "join" unless which("join")
  end

  test do
    system "#{bin}/gjoin", "--version"
  end
end
