class Hostid < Formula
  desc "GNU coreutils' hostid, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-hostid-9.11-arm64-apple-darwin.tar.gz"
      sha256 "8dc7c94dd5c4f014bca032f7152786d5bc660f628ee4194c4f953ba5f2190cdd"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-hostid-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "b5d5b48ab8ae01baca05d0b0a9ef17c929e8a5b5f9a4edc7fa2b51908d2f1ee0"
    end
  end

  def install
    bin.install "bin/ghostid"
    man1.install "share/man/man1/ghostid.1" if File.exist?("share/man/man1/ghostid.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "hostid" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "ghostid" => "hostid" unless which("hostid")
  end

  test do
    system "#{bin}/ghostid", "--version"
  end
end
