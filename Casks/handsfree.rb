cask "handsfree" do
  version "0.1.0-beta.1"
  sha256 "124036e5bf1838fde05c947ff4600724abf5b41ba98faf2b62b661917d343ec3"

  url "https://github.com/suhaasbadada/handsfree/releases/download/v#{version}/HandsFree-#{version}-macos-arm64.dmg",
      verified: "github.com/suhaasbadada/handsfree/"
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
