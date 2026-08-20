class Mkdir < Formula
  desc "GNU coreutils' mkdir, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-mkdir-9.11-arm64-apple-darwin.tar.gz"
      sha256 "6a3f40db19ceba332c793a62536d256678e94dfbed252df6383a999254e4ec8b"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-mkdir-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "49b7cee3d2afc2287fe5812ab304358308ae50387676732da0bf1f6d36870a0a"
    end
  end

  def install
    bin.install "bin/gmkdir"
    man1.install "share/man/man1/gmkdir.1" if File.exist?("share/man/man1/gmkdir.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "mkdir" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gmkdir" => "mkdir" unless which("mkdir")
  end

  test do
    system "#{bin}/gmkdir", "--version"
  end
end
