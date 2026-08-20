class Cat < Formula
  desc "GNU coreutils' cat, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-cat-9.11-arm64-apple-darwin.tar.gz"
      sha256 "cd7972992c4319fa0e63ad723b065f350bfa5339fb93ea60303ead77d677cad3"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-cat-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "7997ad7e48d944e7a1835c5c9eb10c25d35606252c669d39edc411a2d27332c9"
    end
  end

  def install
    bin.install "bin/gcat"
    man1.install "share/man/man1/gcat.1" if File.exist?("share/man/man1/gcat.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "cat" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gcat" => "cat" unless which("cat")
  end

  test do
    system "#{bin}/gcat", "--version"
  end
end
