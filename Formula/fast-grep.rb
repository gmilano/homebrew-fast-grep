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
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/gmilano/fast-grep-rust/releases/download/v#{version}/fast-grep-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3683a0cc729c4212b00c1bb75cfacdf75e9769e21ea3b6197cf958b87835060e"
    end
    on_intel do
      url "https://github.com/gmilano/fast-grep-rust/releases/download/v#{version}/fast-grep-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "85827021fb6fc7e4cd98cfb74b004f59a2e54381438a1f9c5dbc2d91e266fc4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gmilano/fast-grep-rust/releases/download/v#{version}/fast-grep-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86af04099b221babe0f1c3d8e5015ffe897af60aa9376a256d3ba9d6994b0620"
    end
    on_intel do
      url "https://github.com/gmilano/fast-grep-rust/releases/download/v#{version}/fast-grep-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98fa4e96cb36553968109f31d6bdbb1cd4412eec7640b0420d8b09bc78afa794"
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
