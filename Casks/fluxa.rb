cask "fluxa" do
  version "0.3.1"
  sha256 "52c99f2150872e7bf68d784fff0159772549098245d6a78c41b8276bc4f212c1"

  url "https://github.com/FluxaMedia/fluxa/releases/download/v#{version}/fluxa-#{version}-macos-arm64.dmg"
  name "Fluxa"
  desc "Media center"
  homepage "https://github.com/FluxaMedia/fluxa"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Fluxa.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Fluxa.app"]
  end

  zap trash: "~/Library/Application Support/com.fluxa.desktop"
end
