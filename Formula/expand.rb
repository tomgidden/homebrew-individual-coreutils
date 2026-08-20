class Expand < Formula
  desc "GNU coreutils' expand, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-expand-9.11-arm64-apple-darwin.tar.gz"
      sha256 "e9fbd6b95a5251662f424886bda4d8c166ce6a944f79b8b101a50cfa05bf4611"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-expand-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "ab0955cd8be67c8a12e19ee93f3d567857ef0948edf669ace9561ba49b0763d8"
    end
  end

  def install
    bin.install "bin/gexpand"
    man1.install "share/man/man1/gexpand.1" if File.exist?("share/man/man1/gexpand.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "expand" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gexpand" => "expand" unless which("expand")
  end

  test do
    system "#{bin}/gexpand", "--version"
  end
end
