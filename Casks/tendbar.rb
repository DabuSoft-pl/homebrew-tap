cask "tendbar" do
  version "1.1.5"
  sha256 "319f22da4b7214566bf606f9f2018b15bf5e35818f9a09f2fca72c870680c1d3"

  url "https://github.com/DabuSoft-pl/tendbar/releases/download/v#{version}/Tendbar-#{version}.dmg"
  name "Tendbar"
  desc "Menu bar companion for Claude Code sessions"
  homepage "https://github.com/DabuSoft-pl/tendbar"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Tendbar.app"

  zap trash: [
    "~/Library/Application Support/Tendbar",
    "~/Library/Caches/pl.dabusoft.tendbar",
    "~/Library/HTTPStorages/pl.dabusoft.tendbar",
    "~/Library/Preferences/pl.dabusoft.tendbar.plist",
  ]

  caveats <<~EOS
    Open Tendbar, then Settings → Claude Code → Connect.
    Before uninstalling, press Disconnect there, so Claude Code stops calling Tendbar's hooks.
  EOS
end
