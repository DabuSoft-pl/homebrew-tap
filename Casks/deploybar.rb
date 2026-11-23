cask "deploybar" do
  version "0.1.0"
  sha256 "9ef638528cb2c0880a30dd85f1feb046f03f6c7a60be3449288d3e98da53c892"

  url "https://github.com/DabuSoft-pl/deploybar/releases/download/v#{version}/Deploybar-#{version}.dmg"
  name "Deploybar"
  desc "Menu bar view of GitHub Actions runs and Dokploy deploys from a Deploybar hub"
  homepage "https://github.com/DabuSoft-pl/deploybar"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Deploybar.app"

  zap trash: [
    "~/Library/Caches/pl.dabusoft.deploybar",
    "~/Library/HTTPStorages/pl.dabusoft.deploybar",
    "~/Library/Preferences/pl.dabusoft.deploybar.plist",
  ]

  caveats <<~EOS
    Open Deploybar, then Settings: the hub URL and, behind Cloudflare Access, its service token.
  EOS
end
