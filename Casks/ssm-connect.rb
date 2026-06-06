cask "ssm-connect" do
  version "0.1.0"
  sha256 "bb82f03502b9c8de07bfda707e5045cd320e1e3e9bcf811406e0f56f1740c8c3"

  url "https://github.com/vhco-pro/ssm-connect/releases/download/v#{version}/SSMConnect-#{version}.zip"
  name "SSM Connect"
  desc "Menu-bar app that auto-establishes AWS SSM tunnels to EC2 workstations"
  homepage "https://github.com/vhco-pro/ssm-connect"

  depends_on macos: ">= :sonoma"

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
