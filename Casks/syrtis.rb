cask "syrtis" do
  version "2.5.0"
  sha256 "1a590ea86d19f29130e6a5b385ac07ee1f70d211b5280f80424e5b4bb7038d16"

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
