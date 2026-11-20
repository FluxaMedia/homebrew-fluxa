cask "fluxa" do
  version "0.3.9"
  sha256 "5d0ba156463d012fa097559131efdacdfdc75ba8f0ccfce14dfb8748adc2cb97"

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
