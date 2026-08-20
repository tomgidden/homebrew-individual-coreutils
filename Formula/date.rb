class Date < Formula
  desc "GNU coreutils' date, standalone (own tap, not the full coreutils suite)"
  homepage "https://github.com/tomgidden/homebrew-individual-coreutils"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-date-9.11-arm64-apple-darwin.tar.gz"
      sha256 "0c273bcbead15eaa34a44c4ec111b4dad4b1a126f3239f84df46c566665a74b5"
    end
    on_intel do
      url "https://github.com/tomgidden/homebrew-individual-coreutils/releases/download/9.11/homebrew-individual-coreutils-date-9.11-x86_64-apple-darwin.tar.gz"
      sha256 "76fafe217243a4b396db62cd7b86f6c0ecbd24243a961d8eee192833bf48558e"
    end
  end

  def install
    bin.install "bin/gdate"
    man1.install "share/man/man1/gdate.1" if File.exist?("share/man/man1/gdate.1")

    # Only symlink the plain name if nothing else on this machine
    # already provides "date" -- checked here, at install time, on the
    # user's actual machine. Never overwrite or shadow an existing tool.
    bin.install_symlink "gdate" => "date" unless which("date")
  end

  test do
    system "#{bin}/gdate", "--version"
  end
end
