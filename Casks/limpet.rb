cask "limpet" do
  version "1.0.0"
  sha256 "4491a3ad552f20557ea0fa0b64e2b765e9e977ef343a93b24d0c59ce6e351073"

  url "https://github.com/Nanako0129/limpet/releases/download/v#{version}/limpet.app.tar.gz"
  name "limpet"
  desc "Realtime one-way folder mirror to any rclone remote, with a recycle bin"
  homepage "https://github.com/Nanako0129/limpet"

  auto_updates true
  depends_on arch: :arm64
  depends_on formula: "rclone"
  depends_on macos: :ventura

  app "limpet.app"

  uninstall quit: "com.nanako.limpet"

  # Homebrew's launchctl wildcard only matches agents with a running PID, and
  # after a plain uninstall the watchers are crash-looping (PID 0), so boot out
  # every installed watcher plist explicitly.
  zap script: {
        executable: "/bin/bash",
        args:       [
          "-c",
          'for p in "$HOME"/Library/LaunchAgents/com.nanako.limpet.watch.*.plist; do ' \
          '[ -e "$p" ] && launchctl bootout "gui/$(id -u)" "$p" 2>/dev/null; done; true',
        ],
      },
      trash:  [
        "~/.config/limpet",
        "~/.local/bin/limpet",
        "~/.local/bin/limpet-sync.sh",
        "~/.local/log/limpet-*",
        "~/.local/state/limpet",
        "~/Library/Caches/com.nanako.limpet",
        "~/Library/LaunchAgents/com.nanako.limpet.watch.*.plist",
        "~/Library/Preferences/com.nanako.limpet.plist",
      ]

  caveats <<~EOS
    limpet syncs through rclone: add a remote with `rclone config` (or
    `limpet remote add`) before creating a profile.

    `brew uninstall --cask limpet` keeps your profiles and their launchd
    agents, so a reinstall resumes syncing. While the app is missing the
    agents keep failing and append to ~/.local/log/limpet-launchd-*.log.
    `brew uninstall --zap --cask limpet` boots out every limpet watcher agent
    (running or not), deletes their plists, and removes all limpet
    configuration, logs and state.
  EOS
end
