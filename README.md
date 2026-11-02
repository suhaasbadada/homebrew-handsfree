# HandsFree Homebrew tap

```sh
brew install --cask suhaasbadada/handsfree/handsfree
```

[HandsFree](https://suhaasbadada.github.io/handsfree) is local speech-to-text
dictation for **Apple Silicon Macs running macOS 14 Sonoma or later**.
This tap currently distributes **0.1.1-beta.4**, with optional **Push to talk**:
choose it under Settings → Recording mode, hold the shortcut to record, and
release to finish. Toggle remains the default. This release also adds a safer
alternate focused-field lookup and technical diagnostics for Mac paste failures;
some editors may still require manual paste. The stats-first dashboard and
Clean/Warm sounds remain unchanged. Updates preserve statistics, settings, and
the downloaded model.

Homebrew 7 may require explicit trust before loading a third-party cask. If it
reports an untrusted tap, review this repository first; if you trust its code:

```sh
brew trust --cask suhaasbadada/handsfree/handsfree
brew install --cask suhaasbadada/handsfree/handsfree
```

This trusts only this cask's Homebrew code, not the app's signing or notarization.

## Security and first launch

This beta is **self-signed, not Apple-notarized**. Homebrew verifies the pinned
download checksum but does not establish developer trust or fix notarization.
Normal macOS quarantine and Gatekeeper checks remain in place; macOS may block
launch. Review the app's source, release information, and any macOS security
prompts before deciding whether to open it. This tap does not disable security
checks or bypass privacy permissions.

Grant Microphone, Accessibility, and Input Monitoring permissions when needed
for dictation. The app also downloads a speech model of approximately **148 MB**.

## Update

```sh
brew update
brew upgrade --cask suhaasbadada/handsfree/handsfree
```

Beta updates are reviewed manually; automated livecheck is intentionally skipped.

## Uninstall

```sh
brew uninstall --cask suhaasbadada/handsfree/handsfree
```

Uninstalling may quit HandsFree and removes the app, but preserves downloaded
models, settings, statistics, and other user data. There is no automatic `zap`
cleanup. If you want to remove user data, locate and review the app's data in
your user Library and delete only the files you intend to discard; back up
anything you want to keep first.

## Maintainers: update a release

1. Publish a new versioned DMG in a public
   [HandsFree GitHub release](https://github.com/suhaasbadada/handsfree/releases).
   Never replace or mutate an already-published DMG: publish a new version instead.
2. Download the public asset independently and compute `shasum -a 256 <file>`.
   Compare it with the release's SHA-256 digest where available. Never guess the
   checksum or skip verification.
3. Update `version` and `sha256` in `Casks/handsfree.rb`. Confirm the interpolated
   URL identifies that exact version's immutable public asset, and re-check the
   minimum macOS version, architecture, app name, and caveats.
4. With Homebrew installed, run from this repository:

   ```sh
   brew style Casks/handsfree.rb
   brew audit --cask --strict suhaasbadada/handsfree/handsfree
   brew fetch --cask suhaasbadada/handsfree/handsfree
   ```

   The audit and fetch use the registered tap checkout: when testing an
   unpublished change, run them in a separate test environment with this branch
   registered as the tap. Do not overwrite an existing user's tap checkout.
   Fetch verifies the archive checksum without installing or quitting the app.
   These checks do not prove Apple notarization or test app installation.
   Also run `brew audit --cask --strict --online suhaasbadada/handsfree/handsfree`
   and review all findings: Homebrew's online policy rejects this intentional
    GitHub pre-release (`v0.1.1-beta.4 is a GitHub pre-release.`). CI therefore gates
   on the strict audit without `--online` and fetch, not on that stable-release
   policy. Do not suppress unrelated findings or claim the online audit passes.
5. Review the diff, commit, and push; confirm the GitHub Actions checks pass.
   For a published update, run `brew update` before verifying the full cask token.

## License

This tap is [MIT licensed](LICENSE).
