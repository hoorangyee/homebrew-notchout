cask "notchout" do
  version "1.0.0"
  sha256 "a985cf27d497c040d1bc2c42b125ff29af9bfc43f02c812721faa1a8c2f6dc64"

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
