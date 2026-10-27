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
  version "0.14.1"
  license "Apache-2.0"

  # One native executable per platform, needing no JVM.
  on_macos do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-macos-arm64.tar.gz"
      sha256 "c76aeea6aa33367ff5334aead7276fbbb3a20ae52290bfc7c231d71390c99859" # macos-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-macos-x64.tar.gz"
      sha256 "d8599031c4613d17fa6fbdc79fc5705092aa582f761dfc250689a86fb344944c" # macos-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-linux-arm64.tar.gz"
      sha256 "364945980a6c88b3c66ac4e9000f44f343abb827595f367cb7ed2265fdc1c259" # linux-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-linux-x64.tar.gz"
      sha256 "8b5d80aee50331e7e6c8ef41f76feedf70b7d1d2628ab43f62d440b765c1b357" # linux-x64
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
