class Nohup < Formula
  desc "GNU coreutils' nohup, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-nohup-9.11-arm64-apple-darwin.tar.gz"
      sha256 "cbf981566bd10089e44169050f59f00086d9cb1ba69500b6ed7bbf503bb77c29"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-nohup-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "d54ddd15083d75689ac2a061439a268929336e13e180ed62ecd8ff899c10668b"
    end
  end

  def install
    bin.install "bin/gnohup"
    man1.install "share/man/man1/gnohup.1" if File.exist?("share/man/man1/gnohup.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "nohup" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gnohup" => "nohup" unless which("nohup")
  end

  test do
    system "#{bin}/gnohup", "--version"
  end
end
