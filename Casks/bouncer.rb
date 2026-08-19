cask "bouncer" do
  version "0.3.0"
  sha256 "3dd564ec3fc1648a773e6f4340956e832c9a698290a87ac990d1344ef3a951da"

  url "https://github.com/fstermann/bouncer/releases/download/v#{version}/Bouncer-#{version}.dmg"
  name "Bouncer"
  desc "Menu bar manager"
  homepage "https://github.com/fstermann/bouncer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Bouncer.app"

  # Marks the install so Bouncer defers updates to `brew upgrade` and keeps Sparkle off.
  postflight do
    system_command "/usr/bin/defaults",
                   args: ["write", "com.bouncer.app", "InstalledViaHomebrew", "-bool", "true"]
  end

  # Clear the marker on removal so a later direct download isn't misread as brew-managed.
  uninstall_postflight do
    system_command "/usr/bin/defaults",
                   args:         ["delete", "com.bouncer.app", "InstalledViaHomebrew"],
                   must_succeed: false
  end

  uninstall quit: "com.bouncer.app"

  zap trash: "~/Library/Preferences/com.bouncer.app.plist"
end
