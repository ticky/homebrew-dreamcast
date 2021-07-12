cask "gdmenu-card-manager" do
  version "1.3.3"
  sha256 "364dbb3b99375e0b84d226d9e403df69c9aa4276b2ffb287144aa4146d10c842"

  url "https://github.com/sonik-br/GDMENUCardManager/releases/download/#{version}/GDMENUCardManager.v#{version}-osx-x64-AppBundle.tar.gz"
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
