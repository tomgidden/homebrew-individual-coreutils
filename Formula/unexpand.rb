class Unexpand < Formula
  desc "GNU coreutils' unexpand, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-unexpand-9.11-arm64-apple-darwin.tar.gz"
      sha256 "347f3cc2d157cc7eaafa4df64a8078ac9cae5396a1e997ad730cd261250d89bd"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-unexpand-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "f23702e9ed3d5f352c7054107f9ebb1049be993127363f0fa11ab265ec4acb61"
    end
  end

  def install
    bin.install "bin/gunexpand"
    man1.install "share/man/man1/gunexpand.1" if File.exist?("share/man/man1/gunexpand.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "unexpand" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gunexpand" => "unexpand" unless which("unexpand")
  end

  test do
    system "#{bin}/gunexpand", "--version"
  end
end
