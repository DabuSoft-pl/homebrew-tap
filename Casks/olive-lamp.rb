cask "olive-lamp" do
  version "1.0.1"
  sha256 "1a9751bbf1eb5a4e0c6f97e4d9f5561fa4bab03a44c736f015623ef7f7cd8887"

  url "https://github.com/DabuSoft-pl/olive-lamp/releases/download/v#{version}/OliveLamp-#{version}.dmg"
  name "Olive Lamp"
  desc "Menu bar app for OliveTin actions, runs and machines"
  homepage "https://github.com/DabuSoft-pl/olive-lamp"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Olive Lamp.app"

  zap trash: [
    "~/Library/Application Support/Olive Lamp",
    "~/Library/Caches/pl.dabusoft.olivelamp",
    "~/Library/HTTPStorages/pl.dabusoft.olivelamp",
    "~/Library/Preferences/pl.dabusoft.olivelamp.plist",
  ]

  caveats <<~EOS
    Open Olive Lamp and add your OliveTin's address in Settings.
    Its sign-in secrets stay in the Keychain under "Olive Lamp: OliveTin sign-in"; remove them there if you uninstall.
  EOS
end
