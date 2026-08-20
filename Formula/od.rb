class Od < Formula
  desc "GNU coreutils' od, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-od-9.11-arm64-apple-darwin.tar.gz"
      sha256 "7ee99696a1685023320721f2e4155bca1cf69d22cf7a7e22170f36c917b66c44"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-od-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "e777a0e5ced146e8e50e214bcdf0ef8f3e594f0a95f19f3661520a0e8fa346ba"
    end
  end

  def install
    bin.install "bin/god"
    man1.install "share/man/man1/god.1" if File.exist?("share/man/man1/god.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "od" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "god" => "od" unless which("od")
  end

  test do
    system "#{bin}/god", "--version"
  end
end
