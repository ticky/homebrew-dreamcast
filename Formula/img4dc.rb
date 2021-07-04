class Img4dc < Formula
  desc "Utilities to generate selfboot disc images for your Sega Dreamcast"
  homepage "https://github.com/Kazade/img4dc"
  url "https://github.com/Kazade/img4dc.git", revision: "afce20cd7f36d9bbb82013975b0e90e2fa221877"
  version "0.0.0-20210316212253"
  license "GPL-3.0-only"

  depends_on "cmake" => :build

  def install
    mkdir "build"
    cd "build" do
      system "cmake", ".."
      system "make"

      bin.install "cdi4dc/cdi4dc"
      bin.install "mds4dc/mds4dc"
    end
  end

  test do
    assert_match "CDI4DC - 0.5b - Written by SiZiOUS http://www.sizious.com/",
                 shell_output("echo $(#{bin}/cdi4dc)")
    assert_match "MDS4DC - 0.2b - (C)reated by [big_fury]SiZiOUS http://sbibuilder.shorturl.com/",
                 shell_output("echo $(#{bin}/mds4dc)")
  end
end
