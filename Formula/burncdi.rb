class Burncdi < Formula
  desc "Burn CD-formatted Dreamcast images to CD-R"
  homepage "https://github.com/ticky/mksdiso"
  url "https://github.com/ticky/mksdiso/archive/v0.9.2-ticky.1.tar.gz"
  version "0.9.2-ticky.1"
  sha256 "fd72dd8c46026616022868ac2033b266b7cb4d03f143fc9ba72fc298d608cca5"
  license "BSD-2-Clause"
  head "https://github.com/ticky/mksdiso.git"

  depends_on "cdrtools"
  depends_on "ticky/dreamcast/cdirip"

  def install
    bin.install "bin/burncdi"
  end
end
