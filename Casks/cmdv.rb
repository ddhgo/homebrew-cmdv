cask "cmdv" do
  version "0.1.3"
  sha256 "0628d3aec0dcb1475df42999c8332b85c9ed123f84a9d1c66c5f22a0380781d8"

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
