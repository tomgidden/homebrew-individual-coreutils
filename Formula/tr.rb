class Tr < Formula
  desc "GNU coreutils' tr, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tr-9.11-arm64-apple-darwin.tar.gz"
      sha256 "1b4f37988285c20ad3739e74b09157f819cec0c6fae0fcc891f1b44be97891bb"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-tr-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "93dcdbb7aae6794fc8b9f3fb8ec1c9d9efb5400cb324752a9363cc07bf5e8681"
    end
  end

  def install
    bin.install "bin/gtr"
    man1.install "share/man/man1/gtr.1" if File.exist?("share/man/man1/gtr.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "tr" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtr" => "tr" unless which("tr")
  end

  test do
    system "#{bin}/gtr", "--version"
  end
end
