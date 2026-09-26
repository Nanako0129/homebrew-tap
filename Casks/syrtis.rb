cask "syrtis" do
  version "2.0.0"
  sha256 "d45bb0944b6dc744cdd05fb07231ca5551826c03a66ff8cbbfeb1d3a5ad52d91"

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
