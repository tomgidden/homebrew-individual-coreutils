class Sync < Formula
  desc "GNU coreutils' sync, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sync-9.11-arm64-apple-darwin.tar.gz"
      sha256 "e74adbbeec373e7e7cf01e3ca2a11e648e766c73ac788d386facfc282141024f"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sync-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "f53966f0328a93ea591170fa7b571a5e0724573f34fd61c7dba3d949c672b641"
    end
  end

  def install
    bin.install "bin/gsync"
    man1.install "share/man/man1/gsync.1" if File.exist?("share/man/man1/gsync.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "sync" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gsync" => "sync" unless which("sync")
  end

  test do
    system "#{bin}/gsync", "--version"
  end
end
