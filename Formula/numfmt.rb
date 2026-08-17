class Numfmt < Formula
  desc "GNU coreutils' numfmt, standalone (no macOS equivalent exists)"
  homepage "https://github.com/tomgidden/individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-numfmt-9.11-arm64-apple-darwin.tar.gz"
      sha256 "0cbbcbc52042a7bfaaa06feaaf4c6549014878b84fbc74c50d4cfa36e4d2803b"
    end
    on_intel do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-numfmt-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "8b83fa08be50538b53596d7f57d813d02ec2e0795fa89ea7a359ea05de666c5a"
    end
  end

  def install
    bin.install "bin/gnumfmt"
    man1.install "share/man/man1/gnumfmt.1" if File.exist?("share/man/man1/gnumfmt.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "numfmt" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gnumfmt" => "numfmt" unless which("numfmt")
  end

  test do
    system "#{bin}/gnumfmt", "--version"
  end
end
