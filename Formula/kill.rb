class Kill < Formula
  desc "GNU coreutils' kill, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-kill-9.11-arm64-apple-darwin.tar.gz"
      sha256 "8c04010bbe1c4c87bdc138853539f774bac131c7b874dac87c93bb9fb9e05a79"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-kill-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "79e5bda3aa9b59b82e005236dd9e2f63b319f8729ff7a2cb3594d7ed99870063"
    end
  end

  def install
    bin.install "bin/gkill"
    man1.install "share/man/man1/gkill.1" if File.exist?("share/man/man1/gkill.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "kill" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gkill" => "kill" unless which("kill")
  end

  test do
    system "#{bin}/gkill", "--version"
  end
end
