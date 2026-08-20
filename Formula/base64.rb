class Base64 < Formula
  desc "GNU coreutils' base64, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-base64-9.11-arm64-apple-darwin.tar.gz"
      sha256 "96b91aca7f87a8675a91caecc35265280a9b9963f935da61c95513e2ac5904a1"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-base64-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "5a7be457ae45ae952db938840e7a77ef0b02722f929509492e868bf98da99156"
    end
  end

  def install
    bin.install "bin/gbase64"
    man1.install "share/man/man1/gbase64.1" if File.exist?("share/man/man1/gbase64.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "base64" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gbase64" => "base64" unless which("base64")
  end

  test do
    system "#{bin}/gbase64", "--version"
  end
end
