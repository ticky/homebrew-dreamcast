class DcCardMaker < Formula
  desc "Dreamcast GDMenu maker script"
  homepage "https://github.com/jstolarek/dc-card-maker-script"
  url "https://github.com/jstolarek/dc-card-maker-script.git", tag: "v1.2.1"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/ticky/homebrew-dreamcast/releases/download/dc-card-maker-1.2.1"
    sha256 cellar: :any_skip_relocation, catalina:     "c3913548e6ed94a3ddc4a83559b2db8567260a4763f93794e7c8174ef8d867c7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "344f349d1cae2efae4c3c37dff4e14c7c6ca599bae40e35b63612079ac4e85ea"
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
