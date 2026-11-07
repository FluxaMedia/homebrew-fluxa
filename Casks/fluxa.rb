cask "fluxa" do
  version "0.3.5"
  sha256 "bf2d1c41e25c3364ad6d09fa21bae390eddf795bd1b19488552cd71ff9156a39"

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
