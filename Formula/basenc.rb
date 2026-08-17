class Basenc < Formula
  desc "GNU coreutils' basenc, standalone (no macOS equivalent exists)"
  homepage "https://github.com/tomgidden/individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-basenc-9.11-arm64-apple-darwin.tar.gz"
      sha256 "5049657231d28d36123b0d02dd556016eff117cd601b2eeec8570618bded1beb"
    end
    on_intel do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-basenc-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "e01f0b9402e708f2e90ea3515cbb8d4f2c7185bf304c286fe9084b6b390bdd7b"
    end
  end

  def install
    bin.install "bin/gbasenc"
    man1.install "share/man/man1/gbasenc.1" if File.exist?("share/man/man1/gbasenc.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "basenc" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gbasenc" => "basenc" unless which("basenc")
  end

  test do
    system "#{bin}/gbasenc", "--version"
  end
end
