class Link < Formula
  desc "GNU coreutils' link, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-link-9.11-arm64-apple-darwin.tar.gz"
      sha256 "47227561aa3bf2bd66b4e9b7f6f4430148ee15087690779422145854a3d4af50"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-link-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "ea52d0ca99fe7b8c36abec201d15063a9e2ff042f78b4729df0fd1431882b509"
    end
  end

  def install
    bin.install "bin/glink"
    man1.install "share/man/man1/glink.1" if File.exist?("share/man/man1/glink.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "link" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "glink" => "link" unless which("link")
  end

  test do
    system "#{bin}/glink", "--version"
  end
end
