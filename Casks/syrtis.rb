cask "syrtis" do
  version "2.11.3"
  sha256 "ef41d914219c5a8a4d03cf2610822e3d96020eeab600ba6172fb6942565e26db"

  url "https://github.com/Nanako0129/syrtis/releases/download/v#{version}/Syrtis.app.tar.gz"
  name "Syrtis"
  desc "Menubar dashboard for local AI token usage"
  homepage "https://github.com/Nanako0129/syrtis"

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Syrtis.app"

  zap trash: [
    "~/Library/Application Support/com.nyanako.tokenbar",
    "~/Library/Caches/com.nyanako.tokenbar",
    "~/Library/Preferences/com.nyanako.tokenbar.plist",
    "~/Library/Preferences/com.nyanako.tokenbar.beta.plist",
  ]
end
