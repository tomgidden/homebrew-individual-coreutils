class Arch < Formula
  desc "GNU coreutils' arch, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-arch-9.11-arm64-apple-darwin.tar.gz"
      sha256 "3020796777c123457f14ddc666500addeb9343a646bdfe634fc9b7cf82f8cbc8"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-arch-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "084432abc4067c04d3ddb0354e073f6607f758c585f3554bb3d24f165989c0f8"
    end
  end

  def install
    bin.install "bin/garch"
    man1.install "share/man/man1/garch.1" if File.exist?("share/man/man1/garch.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "arch" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "garch" => "arch" unless which("arch")
  end

  test do
    system "#{bin}/garch", "--version"
  end
end
