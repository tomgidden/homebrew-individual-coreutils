class Df < Formula
  desc "GNU coreutils' df, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-df-9.11-arm64-apple-darwin.tar.gz"
      sha256 "0c6790dd6af22d12ebecca6fff9e77e7d3010465d312273fbbc2699369647ff3"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-df-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "dfd0a1bb12a5821470e25a2edf727ad13716e7b71d9ff5435b552f70d1f9a339"
    end
  end

  def install
    bin.install "bin/gdf"
    man1.install "share/man/man1/gdf.1" if File.exist?("share/man/man1/gdf.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "df" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gdf" => "df" unless which("df")
  end

  test do
    system "#{bin}/gdf", "--version"
  end
end
