# Written by scripts/cask.sh in 5xxeu/tforphans on each release. DO NOT EDIT.
cask "tforphans" do
  version "0.1.24"

  on_macos do
    on_arm do
      sha256 "ba0e6fd94f78fb0444eefc79af20ffc692bc3bcfad4466680fb14d5568053a4e"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "75410650198744443b7eb3ba253e6abba3f0ab76904cc27231824a24a6691460"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "ad344fb327a4f0a20c3f290b0dd533c17956eb876162ee6c36b9cd297e7e48d2"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "8dbd6a65438421cdf7f8806f6ff07d081a221f47e95e2011dcf89e3740dc8b2e"
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
