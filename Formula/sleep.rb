class Sleep < Formula
  desc "GNU coreutils' sleep, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sleep-9.11-arm64-apple-darwin.tar.gz"
      sha256 "f5f9b30afba0ed961485a79bf8054530a47a13e8b12cf0d2c47827324fbfb07a"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-sleep-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "07ae49348e302208d7c52aa387dc6134619a17d99ff8edf3ac6a22fa428a6278"
    end
  end

  def install
    bin.install "bin/gsleep"
    man1.install "share/man/man1/gsleep.1" if File.exist?("share/man/man1/gsleep.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "sleep" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gsleep" => "sleep" unless which("sleep")
  end

  test do
    system "#{bin}/gsleep", "--version"
  end
end
