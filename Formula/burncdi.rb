class Burncdi < Formula
  desc "Burn CD-formatted Dreamcast images to CD-R"
  homepage "https://github.com/ticky/mksdiso"
  url "https://github.com/ticky/mksdiso/archive/v0.9.2-ticky.1.tar.gz"
  version "0.9.2-ticky.1"
  sha256 "fd72dd8c46026616022868ac2033b266b7cb4d03f143fc9ba72fc298d608cca5"
  license "BSD-2-Clause"
  head "https://github.com/ticky/mksdiso.git"

  bottle do
    root_url "https://github.com/ticky/homebrew-dreamcast/releases/download/burncdi-0.9.2-ticky.1"
    sha256 cellar: :any_skip_relocation, catalina:     "68ebbc81f535dff06a17d7683630f6303d53ff1514ca6fd587411f55a075c6b4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ad8b42f229643c9b5146b675a46d5e3b34629c8ee17a08c3412c227678df3940"
  end

  depends_on "cdrtools"
  depends_on "ticky/dreamcast/cdirip"

  def install
    bin.install "bin/burncdi"
  end

  test do
    assert_match "Unable to confirm device can be used", shell_output("echo $(#{bin}/burncdi)")
  end
end
