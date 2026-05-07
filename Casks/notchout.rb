cask "notchout" do
  version "1.0.1"
  sha256 "797a1d12d9702d7dd4ddc5edefb862031c65dbc69daf29d64fd236c2cb3897fd"

  url "https://github.com/hoorangyee/notchout/releases/download/v#{version}/NotchOut-#{version}.zip",
      verified: "github.com/hoorangyee/notchout/"
  name "NotchOut"
  desc "Reveals menu bar icons hidden behind the MacBook notch"
  homepage "https://github.com/hoorangyee/notchout"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "NotchOut.app"

  uninstall quit: "com.notchout.app"

  zap trash: [
    "~/Library/Preferences/com.notchout.app.plist",
  ]
end
