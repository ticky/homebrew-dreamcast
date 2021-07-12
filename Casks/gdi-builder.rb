cask "gdi-builder" do
  version "1.3"
  sha256 "2c8de4aba80edeb7a8f0eaaba3f71d5cfe325890fa059f7a24446b27373ce05d"

  url "https://github.com/Sappharad/GDIbuilder/releases/download/v#{version}/gdibuilder#{version.delete(".")}_macOS.zip", verified: "https://github.com/Sappharad/GDIbuilder"
  name "GDMENUCardManager"
  desc "Utility to assist with (re)building Dreamcast .gdi images from scratch"
  homepage "https://projects.sappharad.com/tools/gdibuilder.html"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "GDIBuilder.app"

  uninstall quit: [
    "com.sappharad.gdibuilder",
  ]
end
