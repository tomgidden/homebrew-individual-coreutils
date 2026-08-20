class Md5sum < Formula
  desc "GNU coreutils' md5sum, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-md5sum-9.11-arm64-apple-darwin.tar.gz"
      sha256 "a5667b226ba5291ddb8ae507e0888d7ef867ece19225a46c357a9560eaa39f67"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-md5sum-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "f37a2c47cb23260efd901db5a09b614bbeb4c36983ba05ebfdeeaf1c789df4e7"
    end
  end

  def install
    bin.install "bin/gmd5sum"
    man1.install "share/man/man1/gmd5sum.1" if File.exist?("share/man/man1/gmd5sum.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "md5sum" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gmd5sum" => "md5sum" unless which("md5sum")
  end

  test do
    system "#{bin}/gmd5sum", "--version"
  end
end
