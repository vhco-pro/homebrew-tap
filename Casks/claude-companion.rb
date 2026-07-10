cask "claude-companion" do
  version "0.7.1"
  sha256 "62a710b4b5c3d138953389a7c94c1d90c7d80a7f8551ca421f29eea9bd222245"

  url "https://github.com/vhco-pro/claude-companion/releases/download/v#{version}/ClaudeCompanion-#{version}.zip"
  name "Claude Companion"
  desc "Menu-bar companion for Claude Code that auto-approves tool calls except a shared blacklist"
  homepage "https://github.com/vhco-pro/claude-companion"

  depends_on macos: :sonoma

  app "ClaudeCompanion.app"

  # The app is ad-hoc signed (not notarized), so a quarantined copy is hard-blocked by Gatekeeper
  # ("cannot be verified - move to Trash"), and the companion-hook copied out of the bundle inherits
  # the quarantine bit and gets killed when Claude Code runs it. Strip quarantine right after install
  # so the app launches and the gate runs without any manual `xattr` step.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ClaudeCompanion.app"]
  end

  caveats <<~EOS
    Claude Companion is ad-hoc signed (not notarized). This cask strips the download
    quarantine automatically on install. If macOS still blocks it, run:

      xattr -dr com.apple.quarantine "#{appdir}/ClaudeCompanion.app"

    The headline auto-approve gate installs a Claude Code hook from inside the app
    (a button in the popover), then reload your editor window to activate it.
  EOS

  zap trash: [
    "~/.config/claude-companion",
    "~/Library/Preferences/pro.vhco.claude-companion.plist",
  ]
end
