class Groups < Formula
  desc "GNU coreutils' groups, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-groups-9.11-arm64-apple-darwin.tar.gz"
      sha256 "2454aa13c34020b49006efba7348b91c0c5b4c0c8fcecc387300c21fdd284559"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-groups-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "78b7b4a3eab9eadd964646a190a47aab5f991b72d78ca963e8d8f88eda0d154e"
    end
  end

  def install
    bin.install "bin/ggroups"
    man1.install "share/man/man1/ggroups.1" if File.exist?("share/man/man1/ggroups.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "groups" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "ggroups" => "groups" unless which("groups")
  end

  test do
    system "#{bin}/ggroups", "--version"
  end
end
