class Install < Formula
  desc "GNU coreutils' install, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-install-9.11-arm64-apple-darwin.tar.gz"
      sha256 "a01662ef7dcc2c9b376622028a68e0dc93146e070924ed42f4bebaf457823b9e"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-install-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "4d137a9f7f0439c7be7b0b59168c2128fc97578f4fa9ae3793dd9697f1546d98"
    end
  end

  def install
    bin.install "bin/ginstall"
    man1.install "share/man/man1/ginstall.1" if File.exist?("share/man/man1/ginstall.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "install" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "ginstall" => "install" unless which("install")
  end

  test do
    system "#{bin}/ginstall", "--version"
  end
end
