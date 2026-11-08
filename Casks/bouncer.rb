cask "bouncer" do
  version "0.8.0"
  sha256 "8f2992002df8b8a9308278325b7de6abc9ee4910abdb73ff1e326d9c6d1336a4"

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
