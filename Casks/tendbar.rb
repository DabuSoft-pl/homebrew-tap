cask "tendbar" do
  version "1.1.7"
  sha256 "adde712f06a265b64635403d489bb4ee7eee4601dbacdb1318ae25e393fc04d0"

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
