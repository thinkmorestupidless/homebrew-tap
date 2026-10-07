# The flow CLI, for `brew install thinkmorestupidless/tap/ankka-flow`.
#
# Canonical here, with the version and checksums as placeholders. The release workflow's `homebrew`
# job writes the tag's version into each url (0.0.0 nowhere else: Homebrew reads the version from
# the url, and `brew audit --strict` refuses a `version` line that repeats it) and the checksum
# published beside each native build on the tag's GitHub release — the zero line for each platform
# is found by the comment on it — and commits the result as Formula/ankka-flow.rb in
# thinkmorestupidless/homebrew-tap, beside ankka's own formula. Changes go here; the tap is written
# only by that job.
class AnkkaFlow < Formula
  desc "Command-line client for ankka-flow, streaming pipelines beside ankka"
  homepage "https://flow.ankka.cloud/"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.5.0/ankka-flow-cli-0.5.0-macos-arm64.tar.gz"
      sha256 "0ab217a6f0e6adf3bce97ef9547de0ce2131056b0309ccd95bca7eb6ae57299f" # macos-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.5.0/ankka-flow-cli-0.5.0-macos-x64.tar.gz"
      sha256 "0de312849848e6116d1943b35917326f827f0c5dd0a60ff96e9c5e15a83dffbb" # macos-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.5.0/ankka-flow-cli-0.5.0-linux-arm64.tar.gz"
      sha256 "96f8e8f3a0a9e1d01b9fe2ec97d89824e70c87cc8be6599cef2799f2ee7a443f" # linux-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.5.0/ankka-flow-cli-0.5.0-linux-x64.tar.gz"
      sha256 "865195c2823ac9967f63118b8e2713f6463ae96bb432deb563cc863fa97639ba" # linux-x64
    end
  end

  def install
    bin.install "flow"
  end

  test do
    assert_match "flow #{version}, protocol", shell_output("#{bin}/flow version")
  end
end
