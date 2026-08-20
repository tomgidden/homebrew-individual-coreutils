class Readlink < Formula
  desc "GNU coreutils' readlink, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-readlink-9.11-arm64-apple-darwin.tar.gz"
      sha256 "2206d006b4b30311a4e6dac19586f6a66e32a00d3665fa4fdf5fdcb948ce0e90"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-readlink-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "699b0625b9b16165a4b223236bb51a7be0fc14a05d6f22bbd45a44af0105a477"
    end
  end

  def install
    bin.install "bin/greadlink"
    man1.install "share/man/man1/greadlink.1" if File.exist?("share/man/man1/greadlink.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "readlink" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "greadlink" => "readlink" unless which("readlink")
  end

  test do
    system "#{bin}/greadlink", "--version"
  end
end
