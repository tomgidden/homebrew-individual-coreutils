class Timeout < Formula
  desc "GNU coreutils' timeout, standalone (no macOS equivalent exists)"
  homepage "https://github.com/tomgidden/individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-timeout-9.11-arm64-apple-darwin.tar.gz"
      sha256 "67486e808776a69f30d0f46f82c3c671b56151c27f34c2d56d2218c0f2daa478"
    end
    on_intel do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-timeout-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "0e7b995f2f0b921aa63ed3d06b490ff9d233fbea3a6d5482829e424131693c5d"
    end
  end

  def install
    bin.install "bin/gtimeout"
    man1.install "share/man/man1/gtimeout.1" if File.exist?("share/man/man1/gtimeout.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "timeout" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtimeout" => "timeout" unless which("timeout")
  end

  test do
    system "#{bin}/gtimeout", "--version"
  end
end
