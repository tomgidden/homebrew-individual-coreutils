class Yes < Formula
  desc "GNU coreutils' yes, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-yes-9.11-arm64-apple-darwin.tar.gz"
      sha256 "9ae13dd9be300e3c994a27f8c8fad84aee0a90fe27a6524eea2b028e9c02c8ba"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-yes-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "9c84a74c57ce67618060c43ceefe6cef2683aff052e73a40ffa5db0125e8f33e"
    end
  end

  def install
    bin.install "bin/gyes"
    man1.install "share/man/man1/gyes.1" if File.exist?("share/man/man1/gyes.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "yes" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gyes" => "yes" unless which("yes")
  end

  test do
    system "#{bin}/gyes", "--version"
  end
end
