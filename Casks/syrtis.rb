cask "syrtis" do
  version "2.7.0"
  sha256 "dd02bae50bf59515f71c286733bea6b85bd66644dffb6aff9714cdcaa9552b5b"

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
