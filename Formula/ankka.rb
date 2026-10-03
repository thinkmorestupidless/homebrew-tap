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
  version "0.10.0"
  license "Apache-2.0"

  # One native executable per platform, needing no JVM.
  on_macos do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-macos-arm64.tar.gz"
      sha256 "5fb36b0127efee98c57d82165b991d595d74b9bd28063e34aa3814ddabca3286" # macos-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-macos-x64.tar.gz"
      sha256 "a9cbe892b1cb14153d0500906104b50f7a68cb17e1ee8954dbc7533894298833" # macos-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-linux-arm64.tar.gz"
      sha256 "6463142400f3fed21f9d8c62b29b4d815c8493add99aa11e2749caa6e3c608bb" # linux-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-linux-x64.tar.gz"
      sha256 "336465ff70ccb6026edcd638fa77f6a8cd24592f89b0fea98429b2799be355af" # linux-x64
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
