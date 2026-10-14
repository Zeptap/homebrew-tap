# Zeptap Homebrew tap

[Zeptap](https://zeptap.com) is a Mac app that lets AI agents like Claude Code, Codex and Cursor see, tap, swipe and type on a real iPhone through a local MCP server.

```sh
brew install --cask zeptap/tap/zeptap
```

This installs `Zeptap.app` and a `zeptap` command. `zeptap --stdio` runs the MCP server over stdio for clients that only launch stdio servers; everything else connects to `http://127.0.0.1:47801/mcp` while the app is open. The app updates itself, so `brew upgrade` isn't needed.

Requires macOS 14 or later and an iPhone connected by USB and paired over Bluetooth. Setup: https://zeptap.com/docs/get-started/setup
