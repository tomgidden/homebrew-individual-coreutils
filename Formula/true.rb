class True < Formula
  desc "GNU coreutils' true, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-true-9.11-arm64-apple-darwin.tar.gz"
      sha256 "531d6afc129fc66ec61ae49697ba2430cb5f54b0e2158b8a13e5d2fb07d5a9fc"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-true-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "db6a1e8d7822a9e8b7955a3f016569320fd7ca3eb3dc05a587b57852be4912b6"
    end
  end

  def install
    bin.install "bin/gtrue"
    man1.install "share/man/man1/gtrue.1" if File.exist?("share/man/man1/gtrue.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "true" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtrue" => "true" unless which("true")
  end

  test do
    system "#{bin}/gtrue", "--version"
  end
end
