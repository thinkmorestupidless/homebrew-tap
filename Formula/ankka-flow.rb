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
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.4.1/ankka-flow-cli-0.4.1-macos-arm64.tar.gz"
      sha256 "08efa613dfd529c391a8cfb5f9823ff4c11677ab77159909072aafbd6dc0b768" # macos-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.4.1/ankka-flow-cli-0.4.1-macos-x64.tar.gz"
      sha256 "d0d1d6d50b3d95e5ee5c62422e79b623f16811a2e049aab304eca53249b5c0dc" # macos-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.4.1/ankka-flow-cli-0.4.1-linux-arm64.tar.gz"
      sha256 "db0a1f9a7706e36bcd35e3c25f1c3ae46bebd70459b4c18d74e820600cda4099" # linux-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.4.1/ankka-flow-cli-0.4.1-linux-x64.tar.gz"
      sha256 "467eea3deb7853c24f998963a351f685f7b385cb3e9c45c63000393545056fb3" # linux-x64
    end
  end

  def install
    bin.install "flow"
  end

  test do
    assert_match "flow #{version}, protocol", shell_output("#{bin}/flow version")
  end
end
