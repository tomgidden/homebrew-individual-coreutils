class Test < Formula
  desc "GNU coreutils' test, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-test-9.11-arm64-apple-darwin.tar.gz"
      sha256 "7821e9a07fca36b4dbd0e53d84a2fc6fa31a35ca38c0fa5325b3211a19f88596"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-test-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "5c4154a0f05b35f1dcc1efcc6f129ae001ca96d845a9994fbc74b6a9aba49ab3"
    end
  end

  def install
    bin.install "bin/gtest"
    man1.install "share/man/man1/gtest.1" if File.exist?("share/man/man1/gtest.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "test" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtest" => "test" unless which("test")
  end

  test do
    system "#{bin}/gtest", "--version"
  end
end
