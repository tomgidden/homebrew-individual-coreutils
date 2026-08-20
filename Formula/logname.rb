class Logname < Formula
  desc "GNU coreutils' logname, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-logname-9.11-arm64-apple-darwin.tar.gz"
      sha256 "d46bfba313c48b26947afe1cb28ee9b04ca4df5f0cce7a8ada2abec7aae7b8b8"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-logname-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "83db89c0f33f49e6e407c02796887ed91f734decfe7c3397804900d17ebaeaa5"
    end
  end

  def install
    bin.install "bin/glogname"
    man1.install "share/man/man1/glogname.1" if File.exist?("share/man/man1/glogname.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "logname" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "glogname" => "logname" unless which("logname")
  end

  test do
    system "#{bin}/glogname", "--version"
  end
end
