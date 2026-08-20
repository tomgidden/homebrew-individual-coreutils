class Realpath < Formula
  desc "GNU coreutils' realpath, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-realpath-9.11-arm64-apple-darwin.tar.gz"
      sha256 "552c1ade99d0dd7f806cb765f096308f62b3aefa0a89588ac9a81ff080110153"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-realpath-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "02a89c8bf2c1b86506cf46ad6b1e3d290ccee5dc7429c173f4e9dc0516c2ac70"
    end
  end

  def install
    bin.install "bin/grealpath"
    man1.install "share/man/man1/grealpath.1" if File.exist?("share/man/man1/grealpath.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "realpath" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "grealpath" => "realpath" unless which("realpath")
  end

  test do
    system "#{bin}/grealpath", "--version"
  end
end
