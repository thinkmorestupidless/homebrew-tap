# The flow CLI, for `brew install thinkmorestupidless/tap/ankka-flow`.
#
# Canonical here, with the version and checksums as placeholders. The release workflow's `homebrew`
# job writes the tag's version and the checksum published beside each native build on the tag's
# GitHub release — the zero line for each platform is found by the comment on it — and commits the
# result as Formula/ankka-flow.rb in thinkmorestupidless/homebrew-tap, beside ankka's own formula.
# Changes go here; the tap is written only by that job.
class AnkkaFlow < Formula
  desc "Command-line client for ankka-flow, streaming pipelines beside ankka"
  homepage "https://flow.ankka.cloud/"
  version "0.4.0-rc.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v#{version}/ankka-flow-cli-#{version}-macos-arm64.tar.gz"
      sha256 "5b70e119679c9d49b08d51e45917b6e6a96cfa1244defa567adbe8e5a72694f6" # macos-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v#{version}/ankka-flow-cli-#{version}-macos-x64.tar.gz"
      sha256 "69fe0018527d4111b61e1b4adb0f3992bb78bee625de1d50062c6f61c33b40d2" # macos-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v#{version}/ankka-flow-cli-#{version}-linux-arm64.tar.gz"
      sha256 "3e5e45a6ebd9ce61263d5f91fe2d0287b78a8c8c92700fffab8543be4e4c9da3" # linux-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v#{version}/ankka-flow-cli-#{version}-linux-x64.tar.gz"
      sha256 "5cdb494a3dd3955a96e073fe33718d6429f65b7d2a260985ef61ffb97d990226" # linux-x64
    end
  end

  def install
    bin.install "flow"
  end

  test do
    assert_match "flow #{version}, protocol", shell_output("#{bin}/flow version")
  end
end
