class Pr < Formula
  desc "GNU coreutils' pr, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-pr-9.11-arm64-apple-darwin.tar.gz"
      sha256 "edb1e9710e91c9c232d2a589c7325384dc9bb6b0a3ec2988bee2ffa56d2b394e"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-pr-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "63583d7af6f8e0e0855924881aecf0aedf3bff6b3af9557fae8bca0e8b0beceb"
    end
  end

  def install
    bin.install "bin/gpr"
    man1.install "share/man/man1/gpr.1" if File.exist?("share/man/man1/gpr.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "pr" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gpr" => "pr" unless which("pr")
  end

  test do
    system "#{bin}/gpr", "--version"
  end
end
