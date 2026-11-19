cask "tendbar" do
  version "1.1.17"
  sha256 "c16754be807de619138e6892f1dad7f0f82ea99df744d8c991614658b281909f"

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
