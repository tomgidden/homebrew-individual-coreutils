class Csplit < Formula
  desc "GNU coreutils' csplit, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-csplit-9.11-arm64-apple-darwin.tar.gz"
      sha256 "4c10f05be181d7d303b3420a6a4d1aee3ffdbeac109af4433512dc63e6c28f34"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-csplit-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "93399241c20c26a58cd6e0a502a92913880da3f6188cfb6d21777988b56c56c0"
    end
  end

  def install
    bin.install "bin/gcsplit"
    man1.install "share/man/man1/gcsplit.1" if File.exist?("share/man/man1/gcsplit.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "csplit" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gcsplit" => "csplit" unless which("csplit")
  end

  test do
    system "#{bin}/gcsplit", "--version"
  end
end
