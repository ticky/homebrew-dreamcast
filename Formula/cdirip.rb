class Cdirip < Formula
  desc "Tool to extract tracks from DiscJuggler images"
  homepage "https://web.archive.org/web/20091027000203/http://es.geocities.com/dextstuff/cdirip/news.html"
  url "https://dcemulation.org/1-files/tools/pc/mac/cdirip-0.6.3.zip"
  sha256 "816b1abf724dcc83c7b65d7259735972102a5a60a2a006d5938ef66bebb26acc"
  license "GPL-2.0"

  resource "test-image" do
    url "https://dreamcast.wiki/wiki/images/1/12/GDmenu_v0.6%2824-08-2016%29.zip"
    sha256 "d26c71104f90b58367da84a89d7378909c19a88890631c230b21604541fba811"
  end

  def install
    system "make"
    bin.install "cdirip"
  end

  test do
    resource("test-image").stage testpath
    assert_match "Saving  Track:  1  Type: Mode2/2336  Size: 475     LBA: 0       [cut: 2] [ISO]",
shell_output("#{bin}/cdirip 01/GDmenu_v0.6.cdi")
  end
end
