class Unlink < Formula
  desc "GNU coreutils' unlink, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-unlink-9.11-arm64-apple-darwin.tar.gz"
      sha256 "07582344f05a9c143b8ecbc99d74a15f2410d181026fe1af5741e476ef69e162"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-unlink-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "fc1c9deacffa19519194e4540e07f7b240e4bfa08665fb8b2565d6c0b3435c59"
    end
  end

  def install
    bin.install "bin/gunlink"
    man1.install "share/man/man1/gunlink.1" if File.exist?("share/man/man1/gunlink.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "unlink" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gunlink" => "unlink" unless which("unlink")
  end

  test do
    system "#{bin}/gunlink", "--version"
  end
end
