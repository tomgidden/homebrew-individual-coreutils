class Dirname < Formula
  desc "GNU coreutils' dirname, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-dirname-9.11-arm64-apple-darwin.tar.gz"
      sha256 "0da37e4ea077dcf272117d5c74e58130e81944dcc589a4e7ab86d51d7f74a240"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-dirname-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "94811dd97b020c252c11492af094b1bfed1cd6161f8fb3b047be605036f4dca2"
    end
  end

  def install
    bin.install "bin/gdirname"
    man1.install "share/man/man1/gdirname.1" if File.exist?("share/man/man1/gdirname.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "dirname" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gdirname" => "dirname" unless which("dirname")
  end

  test do
    system "#{bin}/gdirname", "--version"
  end
end
