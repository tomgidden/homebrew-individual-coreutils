class Pinky < Formula
  desc "GNU coreutils' pinky, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-pinky-9.11-arm64-apple-darwin.tar.gz"
      sha256 "2961d92b78f5e09b8eea80e5166919c1d344038e46530cbf8b259d166f37ff6b"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-pinky-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "7b1f5555cf998f3b9367b06338e514e7a2e2fb01f99aab89b56f3f45062356ca"
    end
  end

  def install
    bin.install "bin/gpinky"
    man1.install "share/man/man1/gpinky.1" if File.exist?("share/man/man1/gpinky.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "pinky" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gpinky" => "pinky" unless which("pinky")
  end

  test do
    system "#{bin}/gpinky", "--version"
  end
end
