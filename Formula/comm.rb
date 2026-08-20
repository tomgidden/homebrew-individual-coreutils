class Comm < Formula
  desc "GNU coreutils' comm, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-comm-9.11-arm64-apple-darwin.tar.gz"
      sha256 "61ad088400da107c44d53ded5703afb4c4dc3635f50722439a133629e548c546"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-comm-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "3b7de888b7f9b7e11ae15d6e5e0bb9c08f847027725f18e9ed75fd4d52f646c9"
    end
  end

  def install
    bin.install "bin/gcomm"
    man1.install "share/man/man1/gcomm.1" if File.exist?("share/man/man1/gcomm.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "comm" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gcomm" => "comm" unless which("comm")
  end

  test do
    system "#{bin}/gcomm", "--version"
  end
end
