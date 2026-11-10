cask "handsfree" do
  version "0.1.1-beta.11"
  sha256 "240799cedf24705bbd5b940baaa940a1b3c6c0de01f834f2edf9f1c1dd8b53d3"

  url "https://github.com/suhaasbadada/handsfree/releases/download/v#{version}/HandsFree-#{version}-macos-arm64.dmg"
  name "HandsFree"
  desc "Local speech-to-text dictation"
  homepage "https://suhaasbadada.github.io/handsfree"

  livecheck do
    skip "Beta releases are reviewed and updated manually"
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "HandsFree.app"

  uninstall quit: "com.handsfree.local"

  caveats <<~EOS
    HandsFree is self-signed and is not notarized by Apple.
    Homebrew does not remove quarantine or resolve Gatekeeper restrictions.
    Review macOS security prompts before deciding whether to open the app.

    Dictation requires Microphone, Accessibility, and Input Monitoring permissions.
    The speech model download is approximately 148 MB.
    Uninstalling keeps downloaded models, settings, and other user data.
  EOS
end
