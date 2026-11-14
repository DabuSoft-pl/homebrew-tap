cask "tendbar" do
  version "1.1.2"
  sha256 "20abef34f702ec64c21774bb4b8d1cdb0705f1052a437689317dfea104fa4bad"

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
