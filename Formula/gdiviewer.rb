class Gdiviewer < Formula
  desc "Dreamcast GDI viewer. Parses basic information like title, id, date etc."
  homepage "https://github.com/boyvanamstel/gdiviewer-cli"
  url "https://github.com/boyvanamstel/gdiviewer-cli.git",
      revision: "56340c2661ab4bf7fa85094dfc38af363426947e"
  version "0.0.0.20190117133233"
  license "MIT"
  head "https://github.com/boyvanamstel/gdiviewer-cli.git"

  bottle do
    root_url "https://github.com/ticky/homebrew-dreamcast/releases/download/gdiviewer-0.0.0.20190117133233"
    sha256 cellar: :any_skip_relocation, catalina:     "e14041612eed7645b7a9b42179f855207ae09b5fee87abdd1802a13de221d4d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e62bb6ef3ff4db4da497a999294ef071ec84ef0bdf0fbc8ec1882226ac580a89"
  end

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
    assert_match "Product Number: 20160812 Version Number: Release Date: Maker ID: GDMENU",
                 shell_output("echo $(#{bin}/gdiinfo #{testpath}/test/track01.iso 2>/dev/null)")
  end
end
