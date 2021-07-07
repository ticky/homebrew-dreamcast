class DcScramble < Formula
  desc "Scrambles the binary files for bootable Dreamcast CDs"
  homepage "https://web.archive.org/web/20210606212834/http://mc.pp.se/dc/sw.html"
  url "https://web.archive.org/web/20210419152930if_/http://mc.pp.se/dc/files/scramble.c"
  version "0.0.0"
  sha256 "20f32b06f15a2e2f8a9d92fad6ba72a99794978e4fe5d7d4a2c1e5608738ca47"

  patch :DATA

  def install
    system ENV.cc, "scramble.c", "-o", "dc-scramble"
    bin.install "dc-scramble"
  end

  test do
    assert_match "Usage: #{bin}/dc-scramble [-d] from to",
                 shell_output("echo $(#{bin}/dc-scramble 2>&1)")
  end
end

__END__
--- a/scramble.c	2021-07-06 20:40:29.000000000 -0700
+++ b/scramble.c	2021-07-06 20:40:59.000000000 -0700
@@ -1,5 +1,6 @@
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 
 #define MAXCHUNK (2048*1024)
 
