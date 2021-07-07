class Gdiviewer < Formula
  desc "Dreamcast GDI viewer. Parses basic information like title, id, date etc."
  homepage "https://github.com/boyvanamstel/gdiviewer-cli"
  url "https://github.com/boyvanamstel/gdiviewer-cli.git",
      revision: "56340c2661ab4bf7fa85094dfc38af363426947e"
  version "0.0.0.20190117133233"
  license "MIT"
  head "https://github.com/boyvanamstel/gdiviewer-cli.git"

  def install
    inreplace "gdiinfo.sh", "dirname $1", "dirname \"$1\""
    inreplace "gdils.sh", "/usr/local/bin/gdiinfo {}", "#{bin/"gdiinfo"} \"{}\""
    bin.install "gdiinfo.sh" => "gdiinfo"
    bin.install "gdils.sh" => "gdils"
  end

  test do
    assert_match "Unable to confirm device can be used", shell_output("#{bin}/gdils")
  end
end
