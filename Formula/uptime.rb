class Uptime < Formula
  desc "GNU coreutils' uptime, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-uptime-9.11-arm64-apple-darwin.tar.gz"
      sha256 "82736e756e059705815c65fab2129fdce3b8088e020443183c7631d43dfa3fd3"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-uptime-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "7dfe91f3dee72da94b296852c60152cca0837b3ab298e4794bd9d216d14a0c88"
    end
  end

  def install
    bin.install "bin/guptime"
    man1.install "share/man/man1/guptime.1" if File.exist?("share/man/man1/guptime.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "uptime" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "guptime" => "uptime" unless which("uptime")
  end

  test do
    system "#{bin}/guptime", "--version"
  end
end
