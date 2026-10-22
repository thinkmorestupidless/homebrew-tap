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
  version "0.13.0"
  license "Apache-2.0"

  # One native executable per platform, needing no JVM.
  on_macos do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-macos-arm64.tar.gz"
      sha256 "73bc60eaba8b615d3fe57c6612a23539ac8377a6db9043b07b232678e59a3b0b" # macos-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-macos-x64.tar.gz"
      sha256 "f681a05dae12c02d0bf63dd89ca6dde9f97841558623323250b0492e6b5fbc90" # macos-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-linux-arm64.tar.gz"
      sha256 "41759b8a40539885da4a7cc6d0f5abb4b9e6c5b2f31ff50d25a997515a683f30" # linux-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-linux-x64.tar.gz"
      sha256 "38d3bbcbde5482fd5fdea4e8a4f19d481437a21a4cd9db71c5059efcdf5eb061" # linux-x64
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
