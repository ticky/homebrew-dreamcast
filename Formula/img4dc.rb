class Img4dc < Formula
  desc "Utilities to generate selfboot disc images for your Sega Dreamcast"
  homepage "https://github.com/Kazade/img4dc"
  url "https://github.com/Kazade/img4dc.git", revision: "afce20cd7f36d9bbb82013975b0e90e2fa221877"
  version "0.0.0-20210316212253"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/ticky/homebrew-dreamcast/releases/download/img4dc-0.0.0-20210316212253"
    sha256 cellar: :any_skip_relocation, catalina:     "926319ecac103fd7bb56b8c52070bda56cfeb5c3debe40eccba5afa2ee8b51fc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac3cd934b66b7a6fdd1921a93c292999228b1630b26771320104cde6a1b14157"
  end

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
