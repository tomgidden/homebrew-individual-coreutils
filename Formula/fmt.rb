class Fmt < Formula
  desc "GNU coreutils' fmt, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-fmt-9.11-arm64-apple-darwin.tar.gz"
      sha256 "99e2dba63b57cf8a6351ff3ecc0c1d644e1eba4aca644a50d4e214a4a0e77990"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-fmt-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "dcd3460084280fceb7fd67da8f062f2151a8af7123a1116e2506d09b2b68dd4e"
    end
  end

  def install
    bin.install "bin/gfmt"
    man1.install "share/man/man1/gfmt.1" if File.exist?("share/man/man1/gfmt.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "fmt" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gfmt" => "fmt" unless which("fmt")
  end

  test do
    system "#{bin}/gfmt", "--version"
  end
end
