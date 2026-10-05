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
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.4.0-rc.3/ankka-flow-cli-0.4.0-rc.3-macos-arm64.tar.gz"
      sha256 "6a6cceee43694754595d097d78d2995510e4c6863d8cee7a56788e8aaa18be73" # macos-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.4.0-rc.3/ankka-flow-cli-0.4.0-rc.3-macos-x64.tar.gz"
      sha256 "2073c4de832d5bc0584a64d945e43edbc2bae0fb8890a9cad6b2c86b5c153b39" # macos-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.4.0-rc.3/ankka-flow-cli-0.4.0-rc.3-linux-arm64.tar.gz"
      sha256 "5be9cafab261ec4d06d12798108618ee514f6f71674cb1cb932573365e5d32e0" # linux-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka-flow/releases/download/v0.4.0-rc.3/ankka-flow-cli-0.4.0-rc.3-linux-x64.tar.gz"
      sha256 "a183664d60497559fac0761630b619963301938c409ed9bdd0728803145432e7" # linux-x64
    end
  end

  def install
    bin.install "flow"
  end

  test do
    assert_match "flow #{version}, protocol", shell_output("#{bin}/flow version")
  end
end
