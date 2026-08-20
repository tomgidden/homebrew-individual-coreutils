class Printenv < Formula
  desc "GNU coreutils' printenv, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-printenv-9.11-arm64-apple-darwin.tar.gz"
      sha256 "1861ea3fe03aaa28c1e01b104da7bfd19766ac08d0dff40fa779e84dff5e743b"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-printenv-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "9a45783994d5cc5922c92100ba6baefab74ef2141faefa9c29e738520922ff97"
    end
  end

  def install
    bin.install "bin/gprintenv"
    man1.install "share/man/man1/gprintenv.1" if File.exist?("share/man/man1/gprintenv.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "printenv" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gprintenv" => "printenv" unless which("printenv")
  end

  test do
    system "#{bin}/gprintenv", "--version"
  end
end
