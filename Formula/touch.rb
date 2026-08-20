class Touch < Formula
  desc "GNU coreutils' touch, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-touch-9.11-arm64-apple-darwin.tar.gz"
      sha256 "a8690af17348bac1f5388338f950268af3b625edd81140cd21c226041d8a2424"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-touch-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "491b34a2753e386088dda25029a2e3703bd11208c2853a770e85cf2eb2134979"
    end
  end

  def install
    bin.install "bin/gtouch"
    man1.install "share/man/man1/gtouch.1" if File.exist?("share/man/man1/gtouch.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "touch" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtouch" => "touch" unless which("touch")
  end

  test do
    system "#{bin}/gtouch", "--version"
  end
end
