class Gditools3 < Formula
  desc "Python program/library to handle Dreamcast GD-ROM image files"
  homepage "https://github.com/AltoRetrato/gditools3"
  url "https://github.com/AltoRetrato/gditools3.git",
      revision: "6b1d00dcb7eb110b77aa79af46ba95a6a3a79bb7"
  version "3.0.1"
  license "GPL-3.0-only"
  head "https://github.com/AltoRetrato/gditools3.git"

  bottle do
    root_url "https://github.com/ticky/homebrew-dreamcast/releases/download/gditools3-3.0.1"
    sha256 cellar: :any_skip_relocation, catalina:     "d81a56cbd89c76b8cfe8c70b4ca65a644213f412423f93825df92c27f124cc46"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e10b262365b3cb0bb201b51af7f7133199fe98d6e78ea95e7a89b3e765613555"
  end

  def install
    (pkgshare/"include").install "iso9660.py"

    # This file is both a module and an executable, so we duplicate it
    cp "gditools3.py", "gditools3"
    (pkgshare/"include").install "gditools3.py"

    inreplace "gditools3",
              "from iso9660  import ISO9660 as _ISO9660_orig",
              "sys.path.append('#{pkgshare}/include')\nfrom iso9660  import ISO9660 as _ISO9660_orig"
    bin.install "gditools3"

    cd "gui" do
      (pkgshare/"include").install "PySimpleGUI.py"
      pkgshare.install "gditools64.ico"
      inreplace "gditools3gui.py",
                "sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))",
                "sys.path.append('#{pkgshare}/include')"
      inreplace "gditools3gui.py", "gditools64.ico", pkgshare/"gditools64.ico"
      bin.install "gditools3gui.py" => "gditools3gui"
    end
  end

  test do
    assert_match "gditools3.py  by Ricardo Mendonça Ferreira",
                 shell_output("#{bin}/gditools3")
  end
end
