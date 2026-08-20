class Basenc < Formula
  desc "GNU coreutils' basenc, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-basenc-9.11-arm64-apple-darwin.tar.gz"
      sha256 "ae0e8a2356c43465572a561633b10a8d7f740a62bfbfc444d5b0a950f8a508fd"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-basenc-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "cd4199714b3ef4927119d02d91d0acaf951b94b1172652b2894282c543ce5816"
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
