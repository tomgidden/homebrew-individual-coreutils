class Paste < Formula
  desc "GNU coreutils' paste, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-paste-9.11-arm64-apple-darwin.tar.gz"
      sha256 "b0bd6d8d094745450ae6fdaf1d110465b71a80462347a00a71857841aca2fb2d"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-paste-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "342d41436595e33f1d8c29b5fac394f16c3ecf104c4d574e464a8e00f8981c1d"
    end
  end

  def install
    bin.install "bin/gpaste"
    man1.install "share/man/man1/gpaste.1" if File.exist?("share/man/man1/gpaste.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "paste" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gpaste" => "paste" unless which("paste")
  end

  test do
    system "#{bin}/gpaste", "--version"
  end
end
