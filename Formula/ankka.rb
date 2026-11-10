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
  version "0.16.1"
  license "Apache-2.0"

  # One native executable per platform, needing no JVM.
  on_macos do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-macos-arm64.tar.gz"
      sha256 "333ec61d3dc8b7a1426ec415c79ffd1eb5b857eb485f4947fd9986d0c3ad5bdf" # macos-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-macos-x64.tar.gz"
      sha256 "1311e38ecf53cc6f9d880e09ea53469664a4f455f2a6b1977f96f66afb6129f0" # macos-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-linux-arm64.tar.gz"
      sha256 "e23393a5f28153db98a76dc35b0796d1f992cc0129fe4773187eb05b79d25411" # linux-arm64
    end
    on_intel do
      url "https://github.com/thinkmorestupidless/ankka/releases/download/v#{version}/ankka-cli-#{version}-linux-x64.tar.gz"
      sha256 "45703d5936e2ba6acf25c8661ced54e0804a268d8e1101468726b43e7cec72cc" # linux-x64
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
