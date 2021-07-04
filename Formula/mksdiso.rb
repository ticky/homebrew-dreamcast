class Mksdiso < Formula
  desc "Create Dreamcast SDISOs from Homebrew, CDI or ISO files"
  homepage "https://github.com/ticky/mksdiso"
  url "https://github.com/ticky/mksdiso/archive/v0.9.2-ticky.1.tar.gz"
  version "0.9.2-ticky.1"
  sha256 "fd72dd8c46026616022868ac2033b266b7cb4d03f143fc9ba72fc298d608cca5"
  license "BSD-2-Clause"
  head "https://github.com/ticky/mksdiso.git"

  depends_on "p7zip"
  depends_on "ticky/dreamcast/burncdi"
  depends_on "ticky/dreamcast/cdirip"

  def install
    pkgshare.install Dir["mksdiso/*"]

    inreplace "bin/mksdiso", "DATADIR=$HOME/.mksdiso", "DATADIR=#{pkgshare}"

    bin.install "bin/mksdiso"

    cd "src" do
      system "make"

      # The makefile's install target is more or less useless
      bin.install "binhack/bin/binhack32"
      bin.install "isofix/isofix"
      bin.install "makeip/makeip"
      bin.install "scramble/scramble"
    end
  end
end
