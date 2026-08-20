class Id < Formula
  desc "GNU coreutils' id, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-id-9.11-arm64-apple-darwin.tar.gz"
      sha256 "b9ae03c4ccd5369d903276653650faaaa566e5a1e538fb0c1c6f32b3e152e632"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-id-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "5e79e4b86078e3b6d41bb32a8436894319b19b3112af32dca0fa0a40f3fe38d3"
    end
  end

  def install
    bin.install "bin/gid"
    man1.install "share/man/man1/gid.1" if File.exist?("share/man/man1/gid.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "id" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gid" => "id" unless which("id")
  end

  test do
    system "#{bin}/gid", "--version"
  end
end
