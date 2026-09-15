# homebrew-tap

Homebrew tap for [sniff](https://github.com/fstermann/sniff) and
[Bouncer](https://github.com/fstermann/bouncer).

## sniff

`sniff` finds ambiguous, contradictory, and unverifiable writing.

```sh
brew install fstermann/tap/sniff
```

That auto-taps this repo; no separate `brew tap` step is needed.
Homebrew also installs Vale as a dependency.

Upgrade with:

```sh
brew upgrade sniff
```

## Bouncer

Bouncer is a macOS menu bar manager.

```sh
brew install --cask fstermann/tap/bouncer
```

Bouncer installed this way is updated by Homebrew, not its built-in Sparkle updater:

```sh
brew upgrade --cask bouncer
```
