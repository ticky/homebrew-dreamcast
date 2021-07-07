class Gdiviewer < Formula
  desc "Dreamcast GDI viewer. Parses basic information like title, id, date etc."
  homepage "https://github.com/boyvanamstel/gdiviewer-cli"
  url "https://github.com/boyvanamstel/gdiviewer-cli.git",
      revision: "56340c2661ab4bf7fa85094dfc38af363426947e"
  version "0.0.0.20190117133233"
  license "MIT"
  head "https://github.com/boyvanamstel/gdiviewer-cli.git"

  resource "test-image" do
    url "https://github.com/sonik-br/GDMENUCardManager/raw/master/src/GDMENUCardManager.Core/tools/menu_gdi/track01.iso"
    sha256 "3f538945a8e42cca30a0903008a5865d35d43b3a6a32bf0e0042880c3596a458"
  end

  def install
    inreplace "gdiinfo.sh", "dirname $1", "dirname \"$1\""
    inreplace "gdils.sh", "/usr/local/bin/gdiinfo {}", "#{bin/"gdiinfo"} \"{}\""
    bin.install "gdiinfo.sh" => "gdiinfo"
    bin.install "gdils.sh" => "gdils"
  end

  test do
    resource("test-image").stage testpath/"test"
    assert_match "Hardware ID: SEGA ENTERPRISES Vendor ID: 4893 CD-ROM1/1 Media ID: JUE Media Info: 0199810 Region: MK6969 Peripheral: V0.6.0 Product Number: 20160812 Version Number: Release Date: Maker ID: GDMENU", shell_output("echo $(#{bin}/gdiinfo #{testpath}/test/track01.iso 2>/dev/null)")
  end
end
