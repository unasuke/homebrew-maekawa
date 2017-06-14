class Maekawa < Formula
  MAEKAWA_VERSION = '0.5.1'
  desc "client for AWS CloudWatch Events has idempotence."
  homepage "https://github.com/unasuke/maekawa"
  url "https://github.com/unasuke/maekawa/releases/download/v#{MAEKAWA_VERSION}/maekawa_darwin_amd64"
  sha256 "659ff153e8ac2c7cf6ebdd883b95931d48067572df044a7973ea1e095fd13a87"
  version MAEKAWA_VERSION


  def install
    system "mv", "maekawa_darwin_amd64", "maekawa"
    bin.install "maekawa"
  end

  test do
    system "maekawa", "--version"
  end
end
