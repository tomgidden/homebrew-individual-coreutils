class Chroot < Formula
  desc "GNU coreutils' chroot, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-chroot-9.11-arm64-apple-darwin.tar.gz"
      sha256 "4616a19db903d8c6d518bfdc6f3b70a395b4b3b830e3047695abfe8a18e7ebf7"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-chroot-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "d04562b9dc361ecf5d7fe41c6a69049790273fff0002faddad48020ef237b35e"
    end
  end

  def install
    bin.install "bin/gchroot"
    man1.install "share/man/man1/gchroot.1" if File.exist?("share/man/man1/gchroot.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "chroot" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gchroot" => "chroot" unless which("chroot")
  end

  test do
    system "#{bin}/gchroot", "--version"
  end
end
