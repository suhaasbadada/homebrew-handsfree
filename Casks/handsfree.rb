cask "handsfree" do
  version "0.1.1-beta.2"
  sha256 "1d6372e4562f7b72e8229f07529e2de1657c0459703d9c5c6c2f071cae06ab52"

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
