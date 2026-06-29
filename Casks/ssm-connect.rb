cask "ssm-connect" do
  version "0.2.2"
  sha256 "0c66badfcdd15321b4c33bbfdf2d09c7c994ff0be72de782a4e2744147b41010"

  url "https://github.com/vhco-pro/ssm-connect/releases/download/v#{version}/SSMConnect-#{version}.zip"
  name "SSM Connect"
  desc "Menu-bar app that auto-establishes AWS SSM tunnels to EC2 workstations"
  homepage "https://github.com/vhco-pro/ssm-connect"

  depends_on macos: :sonoma

  app "SSMConnect.app"

  caveats <<~EOS
    SSM Connect is ad-hoc signed (not notarized). On first launch macOS Gatekeeper
    will block it. Approve it once with:

      xattr -dr com.apple.quarantine "#{appdir}/SSMConnect.app"

    or right-click the app in Finder and choose Open.

    Amazon DCV Viewer is required for the default connect action:
      brew install --cask dcv-viewer
  EOS

  zap trash: [
    "~/Library/Preferences/pro.vhco.ssm-connect.plist",
  ]
end
