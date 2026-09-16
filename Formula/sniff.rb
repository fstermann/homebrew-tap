class Sniff < Formula
  desc "Find ambiguous, contradictory, and unverifiable writing"
  homepage "https://github.com/fstermann/sniff"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fstermann/sniff/releases/download/v0.2.1/sniff-0.2.1-macos-aarch64.tar.gz"
      sha256 "d0d527df8270dd9c18b979cd831f526b9b70efcc5939825a6f5229e16e31aaab"
    else
      url "https://github.com/fstermann/sniff/releases/download/v0.2.1/sniff-0.2.1-macos-x86_64.tar.gz"
      sha256 "8ce8813978169e646380a5f9855bf18df93e04f8b22f3102d748c2eece8633f0"
    end
  end

  on_linux do
    url "https://github.com/fstermann/sniff/releases/download/v0.2.1/sniff-0.2.1-linux-x86_64.tar.gz"
    sha256 "7512c2b6db2e36310376617d5dc91d1353bb721e212450f70d5435d6fce52015"
  end

  depends_on "vale"

  def install
    bin.install "sniff"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sniff --version")
  end
end
