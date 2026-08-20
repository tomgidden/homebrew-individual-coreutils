class Timeout < Formula
  desc "GNU coreutils' timeout, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-timeout-9.11-arm64-apple-darwin.tar.gz"
      sha256 "16c0d49f74dea5043968340b1659af7bb590e644fb1710a1c44eb1e74ba66301"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-timeout-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "20b8ea1e172615a384b5b3403e2f0aab042b82e996191908370954bd7d9691c5"
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
