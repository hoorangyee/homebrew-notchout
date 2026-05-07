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

  # The app is ad-hoc signed (no paid Apple Developer ID), so macOS adds a
  # quarantine attribute on download that Gatekeeper enforces. Strip it after
  # install so the app launches without "unverified developer" prompts.
  postflight do
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{appdir}/NotchOut.app"
  end

  uninstall quit: "com.notchout.app"

  zap trash: [
    "~/Library/Preferences/com.notchout.app.plist",
  ]
end
