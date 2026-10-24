# Written by scripts/cask.sh in 5xxeu/tforphans on each release. DO NOT EDIT.
cask "tforphans" do
  version "0.1.18"

  on_macos do
    on_arm do
      sha256 "47fe2d181bed1c894c108db24f86ba198e3c98ae50f7f6ce6cac60fe3e293c64"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "ffd6cc67f95a9de5928ad4fc2243ff3b91a09f2ecf4118cbb04f18f882d9d19c"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "41d55b8e012c0aa2ecfdb78782ae69342d935219f71c99b5c83cd4ba7906f09b"
      url "https://github.com/5xxeu/tforphans/releases/download/v#{version}/tforphans_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "b1f9204d82380b766d169aaf7eba0d7c4c1781cae8a8feea41114e233b10f5a3"
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
