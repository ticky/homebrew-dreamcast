cask "flycast" do
  version "1.0"
  sha256 "d0525a49f5a4e15a89bf41a309a3ef3961bec761fb5ba8153bb0d65e949cdfd6"

  url "https://github.com/flyinghead/flycast/releases/download/v#{version}/flycast-v#{version}-macOS.app.zip"
  name "Flycast"
  desc "Multiplatform Sega Dreamcast, Naomi and Atomiswave emulator"
  homepage "https://github.com/flyinghead/flycast"

  app "Flycast.app"

  uninstall quit: [
    "com.flyinghead.Flycast",
  ]
end
