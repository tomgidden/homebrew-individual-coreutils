class Nproc < Formula
  desc "GNU coreutils' nproc, standalone (no macOS equivalent exists)"
  homepage "https://github.com/tomgidden/individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-nproc-9.11-arm64-apple-darwin.tar.gz"
      sha256 "01f32344a1f8de8fc933f748838bf094d3e3434dcc21813ed33c44cec3f2e1e7"
    end
    on_intel do
      url "https://github.com/tomgidden/individual-coreutils/releases/download/v0.1.0/individual-coreutils-nproc-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "e44caa33ed550c0fa7162a80e5e1078901e4cbfea3bc938758ce6c853506a77c"
    end
  end

  def install
    bin.install "bin/gnproc"
    man1.install "share/man/man1/gnproc.1" if File.exist?("share/man/man1/gnproc.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "nproc" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gnproc" => "nproc" unless which("nproc")
  end

  test do
    system "#{bin}/gnproc", "--version"
  end
end
