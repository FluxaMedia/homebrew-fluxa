cask "fluxa" do
  version "0.3.2"
  sha256 "003bf8756c5396bdb31ec5522abd32954d4ac12be45679738ef86a2a116fea3c"

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
