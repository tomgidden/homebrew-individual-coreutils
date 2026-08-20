class Nl < Formula
  desc "GNU coreutils' nl, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-nl-9.11-arm64-apple-darwin.tar.gz"
      sha256 "31307f722c4d7c7309b1d219caddc14ff95368509c6e3ecb22804554442ee6b2"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-nl-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "0b3604863d7238c8a1e91d535e8ab57273471ed55db9ed912560aaca2a59f5de"
    end
  end

  def install
    bin.install "bin/gnl"
    man1.install "share/man/man1/gnl.1" if File.exist?("share/man/man1/gnl.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "nl" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gnl" => "nl" unless which("nl")
  end

  test do
    system "#{bin}/gnl", "--version"
  end
end
