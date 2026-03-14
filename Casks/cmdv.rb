cask "cmdv" do
  version "0.1.5"
  sha256 "f787051eda321e5b209745b9d9ac92d9dc3161940f5c664ac70a721630147baf"

  url "https://github.com/ddhgo/CmdV/releases/download/v#{version}/CmdV-v#{version}.zip"
  name "CmdV"
  desc "Clipboard history manager for macOS"
  homepage "https://github.com/ddhgo/CmdV"

  depends_on macos: ">= :ventura"

  app "CmdV.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CmdV.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/CmdV",
    "~/Library/Preferences/com.cmdv.app.plist",
  ]
end
