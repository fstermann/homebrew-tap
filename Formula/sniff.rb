class Sniff < Formula
  desc "Find ambiguous, contradictory, and unverifiable writing"
  homepage "https://github.com/fstermann/sniff"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fstermann/sniff/releases/download/v0.2.0/sniff-0.2.0-macos-aarch64.tar.gz"
      sha256 "7c3f10be15d486eb653561564da42ade1a46779c57212b92775a67abb4efa0ef"
    else
      url "https://github.com/fstermann/sniff/releases/download/v0.2.0/sniff-0.2.0-macos-x86_64.tar.gz"
      sha256 "891375c1e28ea3d72cf4093f2853b4a908523c9fe0b69962ffe7b0f303e35778"
    end
  end

  on_linux do
    url "https://github.com/fstermann/sniff/releases/download/v0.2.0/sniff-0.2.0-linux-x86_64.tar.gz"
    sha256 "f8ba722558d39ac2e25bde1da560fd976c85550c5bf29a72425f287705232bec"
  end

  depends_on "vale"

  def install
    bin.install "sniff"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sniff --version")
  end
end
