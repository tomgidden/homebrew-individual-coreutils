class B2sum < Formula
  desc "GNU coreutils' b2sum, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-b2sum-9.11-arm64-apple-darwin.tar.gz"
      sha256 "aef2da0594bf8631c788ae3e61c7544fa25a4faa04f6d7ddec69160e5c96d17a"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-b2sum-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "52435cc3949ba4f1e493c3b18a4117c73316c67c43caa5b70a7ac6b334a3e9b3"
    end
  end

  def install
    bin.install "bin/gb2sum"
    man1.install "share/man/man1/gb2sum.1" if File.exist?("share/man/man1/gb2sum.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "b2sum" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gb2sum" => "b2sum" unless which("b2sum")
  end

  test do
    system "#{bin}/gb2sum", "--version"
  end
end
