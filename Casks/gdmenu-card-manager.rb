cask "gdmenu-card-manager" do
  version "1.3.3"
  sha256 "69dc9d0a172b18ea784acd8fd76277e3ae37ef9ed1b77ab034ef14dadd45cebe"

  url "https://github.com/sonik-br/GDMENUCardManager/releases/download/#{version}/GDMENUCardManager.v#{version}-osx-x64-AppBundle.zip"
  name "GDMENUCardManager"
  desc "Manage content on SD Card for Dreamcast's GDMenu"
  homepage "https://github.com/sonik-br/GDMENUCardManager"

  app "GDMENUCardManager.app"

  preflight do
    # For some reason, version 1.3.3 has busted permissions; neither executable is ...executable
    set_permissions "#{staged_path}/GDMENUCardManager.app/Contents/MacOS/GDMENU", "0755"
    set_permissions "#{staged_path}/GDMENUCardManager.app/Contents/MacOS/GDMENUCardManager/GDMENUCardManager", "0755"
  end

  uninstall quit: [
    "com.github.sonik-br.gdmenucardmanager",
  ]

  zap trash: [
    "~/Library/Preferences/GDMENUCardManager.plist",
  ]
end
