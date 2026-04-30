# Homebrew formula for fast-grep.
#
# Lives in this repo as a template. The real published copy goes to
#   https://github.com/gmilano/homebrew-fast-grep
# and is kept in sync by `packaging/homebrew/update-formula.sh` after each release.
#
# End users install with:
#   brew install gmilano/fast-grep/fast-grep
class FastGrep < Formula
  desc "Indexed regex search. 6-25x faster than ripgrep on large codebases"
  homepage "https://github.com/gmilano/fast-grep-rust"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/gmilano/fast-grep-rust/releases/download/v#{version}/fast-grep-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "30347ec44a2366df64445c85c6075eccbb869b6ed96b2536054e4534f2b5bd6d"
    end
    on_intel do
      url "https://github.com/gmilano/fast-grep-rust/releases/download/v#{version}/fast-grep-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "346359e3b902ecfe5284a7ea5e1f1a5ea6df16060d1e0d0e7884b4fb11ffdf4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gmilano/fast-grep-rust/releases/download/v#{version}/fast-grep-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a47557954ff03f2ee8c74690358cca832425b4496639f7ef945daf93520b3748"
    end
    on_intel do
      url "https://github.com/gmilano/fast-grep-rust/releases/download/v#{version}/fast-grep-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63474cd100cb662aebb4350183586462fb5f45260ff95cf14593b0b7d9b1fa6e"
    end
  end

  def install
    bin.install "fgr"
    doc.install "README.md", "LICENSE"
  end

  test do
    system "#{bin}/fgr", "--version"
  end
end
