# vhco-pro Homebrew Tap

Homebrew tap for [vhco-pro](https://github.com/vhco-pro) tools.

## SSM Connect

macOS menu-bar app that automates AWS SSO + EC2 + SSM tunnel + DCV auto-login for cloud
workstations. ([source](https://github.com/vhco-pro/ssm-connect))

```bash
brew install --cask vhco-pro/tap/ssm-connect
```

Ad-hoc signed (not notarized) — approve via Gatekeeper on first launch:
`xattr -dr com.apple.quarantine "/Applications/SSMConnect.app"` or right-click → Open.
