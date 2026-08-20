class Env < Formula
  desc "GNU coreutils' env, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-env-9.11-arm64-apple-darwin.tar.gz"
      sha256 "14461f29da0b8f2d81ac53a33d54c95a50980e8864b80a82b03053426ea7f2ea"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-env-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "6ec0558f8af06e9de5a7f85060e21c876b2c007c75338706665ef48e954a0e85"
    end
  end

  def install
    bin.install "bin/genv"
    man1.install "share/man/man1/genv.1" if File.exist?("share/man/man1/genv.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "env" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "genv" => "env" unless which("env")
  end

  test do
    system "#{bin}/genv", "--version"
  end
end
