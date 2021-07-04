class Cdirip < Formula
  desc "Tool to extract tracks from DiscJuggler images"
  homepage "https://web.archive.org/web/20091027000203/http://es.geocities.com/dextstuff/cdirip/news.html"
  url "https://dcemulation.org/1-files/tools/pc/mac/cdirip-0.6.3.zip"
  sha256 "816b1abf724dcc83c7b65d7259735972102a5a60a2a006d5938ef66bebb26acc"
  license "GPL-2.0-only"

  bottle do
    root_url "https://github.com/ticky/homebrew-dreamcast/releases/download/cdirip-0.6.3"
    sha256 cellar: :any_skip_relocation, catalina:     "0b5975e90952bd8c09864083f08ef51d4f0ebec6ff4113ab909a0fa171ad149a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "61207f10fd8e4e5ec91d57785c28a74989dfb7351d52a817b1be20c290a5fbbd"
  end

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
