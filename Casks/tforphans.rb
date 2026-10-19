# Written by scripts/cask.sh in 5xxeu/tforphans on each release. DO NOT EDIT.
cask "tforphans" do
  version "0.1.12"

  on_macos do
    on_arm do
      sha256 "e4dd33b89449a42e658a7b36fcc35df55ddffa501b472e756372e8102a784703"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "f900032b656174739b83dbdb05c68cc160a660727da22aa693a3ffa7a7db64fe"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "e40d5d1f001b27af763499cf7a531ea4f71fbaf1c223b95737db68b16dd4cd35"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "af1e5590206b64c4273cc91ed1cc5f16b123c484e438512d53609e09587c6696"
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
