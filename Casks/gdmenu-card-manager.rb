cask "gdmenu-card-manager" do
  version "1.3.3.1" # NOTE: This is a fake version so we have a "revision" over the prior version, as the underlying release has changed
  sha256 "364dbb3b99375e0b84d226d9e403df69c9aa4276b2ffb287144aa4146d10c842"

  # TODO: Once a new release is cut, switch back to the variable version
  # url "https://github.com/sonik-br/GDMENUCardManager/releases/download/#{version}/GDMENUCardManager.v#{version}-osx-x64-AppBundle.tar.gz"

  url "https://github.com/sonik-br/GDMENUCardManager/releases/download/1.3.3/GDMENUCardManager.v1.3.3-osx-x64-AppBundle.tar.gz"
  name "GDMENUCardManager"
  desc "Manage content on SD Card for Dreamcast's GDMenu"
  homepage "https://github.com/sonik-br/GDMENUCardManager"

  app "GDMENUCardManager.app"

  uninstall quit: [
    "com.github.sonik-br.gdmenucardmanager",
  ]

  zap trash: [
    "~/Library/Preferences/GDMENUCardManager.plist",
  ]
end
