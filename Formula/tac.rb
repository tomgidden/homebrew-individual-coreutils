class Tac < Formula
  desc "GNU coreutils' tac, standalone (no macOS equivalent exists)"
  homepage "https://github.com/tomgidden/individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-tac-9.11-arm64-apple-darwin.tar.gz"
      sha256 "6328f861847daa097d262c3161691a99e6c37470edb81eb3b83e919028a14006"
    end
    on_intel do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-tac-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "47bdc2012c87ef64e7dd18cf2cc0c077f448c35bd1044afc08e2dbaa691bcf3a"
    end
  end

  def install
    bin.install "bin/gtac"
    man1.install "share/man/man1/gtac.1" if File.exist?("share/man/man1/gtac.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "tac" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gtac" => "tac" unless which("tac")
  end

  test do
    system "#{bin}/gtac", "--version"
  end
end
