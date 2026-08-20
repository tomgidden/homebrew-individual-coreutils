class Pwd < Formula
  desc "GNU coreutils' pwd, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-pwd-9.11-arm64-apple-darwin.tar.gz"
      sha256 "5210aef4d83927251bc2e0ea1b882493a6cf606445fdd4d14a2be281bb41a654"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-pwd-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "5d34e1cae47cb8c030ab0e5b36ab353a7a7c556b05626c282e76604eb6cdb2ff"
    end
  end

  def install
    bin.install "bin/gpwd"
    man1.install "share/man/man1/gpwd.1" if File.exist?("share/man/man1/gpwd.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "pwd" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gpwd" => "pwd" unless which("pwd")
  end

  test do
    system "#{bin}/gpwd", "--version"
  end
end
