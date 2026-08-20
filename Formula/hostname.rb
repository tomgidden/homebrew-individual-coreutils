class Hostname < Formula
  desc "GNU coreutils' hostname, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-hostname-9.11-arm64-apple-darwin.tar.gz"
      sha256 "2c92c41c9cbc0dda73b9e0ea8b87b5eb6122f74070a4847d08be5a491972dd26"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-hostname-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "1238b29d473d61750844afac0e3c8d9621b01d93d036fe7c9ea7d385768990fe"
    end
  end

  def install
    bin.install "bin/ghostname"
    man1.install "share/man/man1/ghostname.1" if File.exist?("share/man/man1/ghostname.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "hostname" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "ghostname" => "hostname" unless which("hostname")
  end

  test do
    system "#{bin}/ghostname", "--version"
  end
end
