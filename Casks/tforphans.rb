# Written by scripts/cask.sh in 5xxeu/tforphans on each release. DO NOT EDIT.
cask "tforphans" do
  version "0.1.15"

  on_macos do
    on_arm do
      sha256 "e15fa84f3c721ad3d0ee94c47e24667a23db1813daa4fc6a5b4fa8a5e37018c6"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "09cd413c1f12147c143e8f7e2221e074edb6b9c3820c42c9159d9bae4af51e0b"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "b49eb8f21b19b83d0cbb1518b7060711c1a2a77b2666e7726d05ed55cda7aaaf"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "973912ba4125e8abaeb40f738509770b32d3cb870db07a03aef694d48ee158f7"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_linux_amd64.tar.gz"
    end
  end

  name "tforphans"
  desc "Find cloud resources that no Terraform state manages"
  homepage "https://github.com/5xxeu/tforphans"

  livecheck do
    skip "Written on release."
  end

  binary "tforphans"

  # The binaries are not notarized: drop the quarantine flag that brew sets
  # on downloads, or macOS refuses to run them.
  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/tforphans"]
    end
  end
end
