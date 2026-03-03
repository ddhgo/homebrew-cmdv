cask "cmdv" do
  version "0.1.0"
  sha256 "b9cba306e30a857d3b4c160c382755a2f4a57ae5728f31178756b5af58aa2ed2"

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
    "~/Library/Preferences/com.ddhgo.CmdV.plist",
  ]
end
