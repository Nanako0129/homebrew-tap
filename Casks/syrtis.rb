cask "syrtis" do
  version "2.1.0"
  sha256 "0c187539b313cf0564c7ae9ba024f759d672d3c0b3b4862d27a80d5b32e2b676"

  url "https://github.com/Nanako0129/syrtis/releases/download/v#{version}/Syrtis.app.tar.gz"
  name "Syrtis"
  desc "Menubar dashboard for local AI token usage"
  homepage "https://github.com/Nanako0129/syrtis"

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Syrtis.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Syrtis.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.nyanako.tokenbar",
    "~/Library/Caches/com.nyanako.tokenbar",
    "~/Library/Preferences/com.nyanako.tokenbar.plist",
    "~/Library/Preferences/com.nyanako.tokenbar.beta.plist",
  ]
end
