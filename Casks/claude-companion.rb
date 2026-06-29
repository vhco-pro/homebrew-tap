cask "claude-companion" do
  version "0.5.1"
  sha256 "b35197e876f1ee463d051bf6f76194877c17366121cf1f8b4e8205f5d0405138"

  url "https://github.com/vhco-pro/claude-companion/releases/download/v#{version}/ClaudeCompanion-#{version}.zip"
  name "Claude Companion"
  desc "Menu-bar companion for Claude Code that auto-approves tool calls except a shared blacklist"
  homepage "https://github.com/vhco-pro/claude-companion"

  depends_on macos: :sonoma

  app "ClaudeCompanion.app"

  caveats <<~EOS
    Claude Companion is ad-hoc signed (not notarized). On first launch macOS Gatekeeper
    will block it. Approve it once with:

      xattr -dr com.apple.quarantine "#{appdir}/ClaudeCompanion.app"

    or right-click the app in Finder and choose Open.

    The headline auto-approve gate installs a Claude Code hook from inside the app
    (a button in the popover), then reload your editor window to activate it.
  EOS

  zap trash: [
    "~/.config/claude-companion",
    "~/Library/Preferences/pro.vhco.claude-companion.plist",
  ]
end
