cask "cmdv" do
  version "0.1.8"
  sha256 "#{ARGV[0]}"

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
