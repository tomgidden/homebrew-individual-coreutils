class Uniq < Formula
  desc "GNU coreutils' uniq, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-uniq-9.11-arm64-apple-darwin.tar.gz"
      sha256 "717420e4b3d3d68485ef4cc6adbefd30c8ec4bcb05388d9d94060e9104d4e299"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-uniq-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "847d550b838023c1fac856eb468de0cdd2b9813d9f1b60512bb40b2a5440a438"
    end
  end

  def install
    bin.install "bin/guniq"
    man1.install "share/man/man1/guniq.1" if File.exist?("share/man/man1/guniq.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "uniq" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "guniq" => "uniq" unless which("uniq")
  end

  test do
    system "#{bin}/guniq", "--version"
  end
end
