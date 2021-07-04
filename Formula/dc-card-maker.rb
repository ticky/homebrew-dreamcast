class DcCardMaker < Formula
  desc "Dreamcast GDMenu maker script"
  homepage "https://github.com/jstolarek/dc-card-maker-script"
  url "https://github.com/jstolarek/dc-card-maker-script.git", tag: "v1.2.1"
  license "GPL"

  depends_on "ticky/dreamcast/cdirip"
  depends_on "cdrtools"
  depends_on "img4dc"

  def install
    pkgshare.install "data"
    pkgshare.install "ini"
    pkgshare.install "tools"

    inreplace "dc-card-maker.sh", "genisoimage", "mkisofs"
    inreplace "dc-card-maker.sh", "./tools/cdi4dc", "cdi4dc"
    inreplace "dc-card-maker.sh",
              "This script requires cdi4dc to be present in tools/ directory",
              "This script requires cdi4dc to be present in the system"
    inreplace "dc-card-maker.sh", "./tools/cdirip", "cdirip"
    inreplace "dc-card-maker.sh",
              "This script requires cdirip to be present in tools/ directory",
              "This script requires cdirip to be present in the system"
    inreplace "dc-card-maker.sh", "./tools/gditools.py", pkgshare/"tools/gditools.py"
    inreplace "dc-card-maker.sh", "data/", pkgshare/"data/"
    inreplace "dc-card-maker.sh", "ini/", pkgshare/"ini/"

    bin.install "dc-card-maker.sh" => "dc-card-maker"
  end

  test do
    mkdir "input"
    mkdir "output"
    touch "test.txt"
    system bin/"dc-card-maker", "test.txt", "input", "output"
    assert_predicate testpath/"output/GDEMU.ini", :exist?
    assert_predicate testpath/"output/01", :exist?
  end
end
