class Chown < Formula
  desc "GNU coreutils' chown, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-chown-9.11-arm64-apple-darwin.tar.gz"
      sha256 "f5bccbcc85b74662b5bf73e41c44f203e95c28464cda5e8f6586f960a86b3383"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-chown-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "11f832905046b83e74873d36dc82729224e811401fcc4544d1ca61799ee1a4f3"
    end
  end

  def install
    bin.install "bin/gchown"
    man1.install "share/man/man1/gchown.1" if File.exist?("share/man/man1/gchown.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "chown" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gchown" => "chown" unless which("chown")
  end

  test do
    system "#{bin}/gchown", "--version"
  end
end
