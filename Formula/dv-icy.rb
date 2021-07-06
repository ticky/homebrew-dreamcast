class DvIcy < Formula
  desc "Dreamcast VMU icon viewer and converter"
  homepage "https://www.dreamcast-talk.com/forum/viewtopic.php?t=11842"
  url "https://www.nz17.com/interactive/dreamcast/dv_icy-dreamcast_vmu_icon_viewer_and_converter/0.9/dv_icy-dreamcast_vmu_icon_viewer_and_converter-0.9.zip"
  sha256 "4635c7af2834ad62bb29203ca7e2e67d15b723dad1e4dc1cdbc181ca289806ab"
  license "AGPL-3.0-or-later"

  depends_on "sdl"

  def install
    inreplace "dv_icy-dreamcast_vmu_icon_viewer_and_converter.cpp",
              "dv_icy-dreamcast_vmu_icon_viewer_and_converter", "dv-icy"

    flags = `sdl-config --cflags`.split
    system ENV.cxx, "-c", "dv_icy-dreamcast_vmu_icon_viewer_and_converter.cpp",
           "-o", "dv-icy.o",
           *flags,
           "-ansi", "-Wall"

    libs = `sdl-config --libs`.split
    system ENV.cxx, "dv-icy.o",
           "-o", "dv-icy",
           *libs

    bin.install "dv-icy"
  end

  test do
    assert_match "Usage: dv-icy [options] [file] -a",
                 shell_output("echo $(#{bin}/dv-icy)")
  end
end
