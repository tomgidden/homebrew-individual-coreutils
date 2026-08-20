class False < Formula
  desc "GNU coreutils' false, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-false-9.11-arm64-apple-darwin.tar.gz"
      sha256 "38536c9b3f1bac114a44f43f137cd968de2641667457d164f9089d603710d028"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-false-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "436ab84ca4b12beabe0ea6db3e24187eff70477f4ae5112d56e37f013405a866"
    end
  end

  def install
    bin.install "bin/gfalse"
    man1.install "share/man/man1/gfalse.1" if File.exist?("share/man/man1/gfalse.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "false" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gfalse" => "false" unless which("false")
  end

  test do
    system "#{bin}/gfalse", "--version"
  end
end
