cask "gdmenu-card-manager" do
  version "1.3.5"
  sha256 "2b1a8030bbda3d86af75b62fa1190c2a0f2eb9be80b2c9baf50bb71132df0c6d"

  url "https://github.com/sonik-br/GDMENUCardManager/releases/download/v#{version}/GDMENUCardManager.v#{version}-osx-x64-AppBundle.tar.gz"
  name "GDMENUCardManager"
  desc "Manage content on SD Card for Dreamcast's GDMenu"
  homepage "https://github.com/sonik-br/GDMENUCardManager"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "GDMENUCardManager.app"

  uninstall quit: [
    "com.github.sonik-br.gdmenucardmanager",
  ]

  zap trash: [
    "~/Library/Preferences/GDMENUCardManager.plist",
  ]
end
