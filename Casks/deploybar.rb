cask "deploybar" do
  version "0.1.1"
  sha256 "2becbd8442d7bfb6de0a5776d575946b92bf3d5c5d5a850af0f9ee67bbe543a5"

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
