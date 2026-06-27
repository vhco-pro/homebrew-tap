cask "claude-companion" do
  version "0.4.0"
  sha256 "c864c03bb785aa38432d9ae35a0aacc025822e2e1572b530b7c28c5f21c979ab"

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
