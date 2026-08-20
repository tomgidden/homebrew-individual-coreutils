class Chgrp < Formula
  desc "GNU coreutils' chgrp, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-chgrp-9.11-arm64-apple-darwin.tar.gz"
      sha256 "66a960e5db6471987854db0d621d39308146e2cfe9809602ae15e6d41364241e"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-chgrp-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "8b8afb7b45349dc042f28fb6678d6b55d112dcf5a64d0cb69b7c7866a928a99c"
    end
  end

  def install
    bin.install "bin/gchgrp"
    man1.install "share/man/man1/gchgrp.1" if File.exist?("share/man/man1/gchgrp.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "chgrp" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gchgrp" => "chgrp" unless which("chgrp")
  end

  test do
    system "#{bin}/gchgrp", "--version"
  end
end
