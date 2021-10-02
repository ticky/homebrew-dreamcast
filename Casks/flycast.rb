cask "flycast" do
  version "1.1"
  sha256 "d1f6f9443313c3aa7624a179d4dab4259628286f306751efceb1d1b5b2c15795"

  url "https://github.com/flyinghead/flycast/releases/download/v#{version}/flycast-v#{version}-macOS.app.zip"
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
