cask "tendbar" do
  version "1.1.15"
  sha256 "d9c2559d4ad78bf6c41a41c9150177007c3cc89f3f4b96794efee1ce6bd44255"

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
