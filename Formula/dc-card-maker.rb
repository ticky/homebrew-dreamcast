class DcCardMaker < Formula
  desc "Dreamcast GDMenu maker script"
  homepage "https://github.com/jstolarek/dc-card-maker-script"
  url "https://github.com/jstolarek/dc-card-maker-script.git", tag: "v1.2.1"
  license "GPL-2.0-or-later"

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/ticky/homebrew-dreamcast/releases/download/dc-card-maker-1.2.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, catalina:     "c39226282874b38a72e252c30b846f73e8a345d75915dd5a0283bf495af9c35e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e5d3920d55b20524f191222518395633942487990d45ef6c2222911d06b114f2"
  end

  depends_on "cdrtools"
  depends_on "ticky/dreamcast/cdirip"
  depends_on "ticky/dreamcast/img4dc"

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
    inreplace "dc-card-maker.sh", "GDMENU_INI=ini/LIST.INI", "GDMENU_INI=\"$(mktemp -d -t ini-XXXXX)/LIST.INI\""
    inreplace "dc-card-maker.sh", "ini/", pkgshare/"ini/"

    bin.install "dc-card-maker.sh" => "dc-card-maker"
  end

  test do
    mkdir "input"
    mkdir "output"
    touch "test.txt"
    system bin/"dc-card-maker", "test.txt", "input", "output"
    assert_predicate testpath/"output/GDEMU.ini", :exist?
    assert_predicate testpath/"output/01/gdmenu.cdi", :exist?
  end
end
