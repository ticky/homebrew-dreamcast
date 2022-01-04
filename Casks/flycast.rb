cask "flycast" do
  version "1.2"
  sha256 "144b0b603bbd7bdc707cd9839ca550d665c62a1f4d1c09181ab02fc641058f89"

  url "https://github.com/flyinghead/flycast/releases/download/v#{version}/flycast-macOS-#{version}.zip"
  name "Flycast"
  desc "Multiplatform Sega Dreamcast, Naomi and Atomiswave emulator"
  homepage "https://github.com/flyinghead/flycast"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Flycast.app"

  uninstall quit: [
    "com.flyinghead.Flycast",
  ]
end
