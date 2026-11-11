# The ankka CLI, for `brew install thinkmorestupidless/tap/ankka`.
#
# Generated. In the ankka repository the version and the checksums are placeholders; the release
# workflow's `homebrew` job reads the checksum published beside each native build on the tag's GitHub
# release, writes the tag's version and those checksums in here — each checksum by the platform named
# in the comment on its line — and pushes homebrew/ to thinkmorestupidless/homebrew-tap. Changes go to
# the ankka repository, not to the tap.
class Ankka < Formula
  desc "Command-line client for ankka, a serverless platform for agentic AI"
  homepage "https://docs.ankka.cloud/"
  version "0.16.2"
  license "Apache-2.0"

  # One native executable per platform, needing no JVM.
  on_macos do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-macos-arm64.tar.gz"
      sha256 "c023d7438ad93057b074fbe70ceb45e26ddf664e87c0f22c89ce4bec1f74a8ac" # macos-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-macos-x64.tar.gz"
      sha256 "08a7474ee3221ce38076cf121ac779363a38e440f7fe19582f209dea39de5824" # macos-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-linux-arm64.tar.gz"
      sha256 "b53132fef9b6b671e8ae762ba5821697bd147904f3476b376417336020fc6569" # linux-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-linux-x64.tar.gz"
      sha256 "0fa0512ac7403c49365c57c0b7aad24e36bc55e2723c7b64d1ffdcf638352662" # linux-x64
    end
  end

  def install
    bin.install "ankka"
  end

  def caveats
    <<~EOS
      `ankka init` creates a Scala service from the template by running `sbt new`, so it needs sbt:
        brew install sbt
      Every other command works without it.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ankka version").strip
  end
end
