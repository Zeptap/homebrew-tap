cask "zeptap" do
  version "0.6.0"
  sha256 "2e9199a2ef2fe4026813308ef197537c3fb8c835ef877f9700700bf4635fc9fb"

  url "https://github.com/Zeptap/releases/releases/download/v#{version}/Zeptap-#{version}.dmg"
  name "Zeptap"
  desc "Lets AI agents see, tap and type on a real iPhone through a local MCP server"
  homepage "https://zeptap.com/"

  livecheck do
    url "https://github.com/Zeptap/releases/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Zeptap.app"
  # `zeptap --stdio` is the MCP server over stdio, for clients that only launch stdio servers.
  binary "#{appdir}/Zeptap.app/Contents/MacOS/Zeptap", target: "zeptap"

  zap trash: [
    "~/Library/Application Support/Zeptap",
    "~/Library/Caches/com.afterlume.zeptap",
    "~/Library/HTTPStorages/com.afterlume.zeptap",
    "~/Library/Preferences/com.afterlume.zeptap.plist",
  ]

  caveats <<~EOS
    Zeptap runs an MCP server at http://127.0.0.1:47801/mcp while the app is open.
    Add it to an agent from the app (Settings > Connectors), or by hand:
      claude mcp add --transport http --scope user zeptap http://127.0.0.1:47801/mcp
    Clients that only launch stdio servers can run:
      zeptap --stdio
    Setup: https://zeptap.com/docs/get-started/setup
  EOS
end
