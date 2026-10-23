# Written by scripts/cask.sh in 5xxeu/tforphans on each release. DO NOT EDIT.
cask "tforphans" do
  version "0.1.16"

  on_macos do
    on_arm do
      sha256 "2d098e691de6398f825a91cb186fb4ed9864b8077f8b85afa5c72377e021c982"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "31928710995a6b86f877a10ea7e1f78ffe527e4d7f80ebc5218fe35a99f614b4"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "ef0bed28e058f53176b14bb450b30fdaa7b096bd6fdfa942c3eb0b5550729276"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "4a62b1cbfc0051bc1ee23e057e35cb7f3feeb38ba54ee93da8d17ab19753435a"
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
