class Cp < Formula
  desc "GNU coreutils' cp, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-cp-9.11-arm64-apple-darwin.tar.gz"
      sha256 "2e22f52b15c3c10d23cbbb661eb1dba8fdcb5e6b11dd58ee3d72ecfc8f447438"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-cp-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "0a021a815d2ae6296c5c939ed5e408ac28ebeb9e5eeb105f851e33c247d71d20"
    end
  end

  def install
    bin.install "bin/gcp"
    man1.install "share/man/man1/gcp.1" if File.exist?("share/man/man1/gcp.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "cp" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gcp" => "cp" unless which("cp")
  end

  test do
    system "#{bin}/gcp", "--version"
  end
end
