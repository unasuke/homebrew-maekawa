class Maekawa < Formula
  desc "client for AWS CloudWatch Events has idempotence."
  homepage "https://github.com/unasuke/maekawa"

  stable do
    url "https://github.com/unasuke/maekawa/releases/download/v0.1.0/maekawa_darwin_amd64"
    sha256 "3526921d84b14cccb58f44410fb3909e5959ed86740574c9b233cb8e1ea4be1a"
  end

  #head do
  #  url "https://github.com/unasuke/maekawa/archive/v0.1.0.tar.gz"
  #  sha256 "2aefe28150bcbe5423c28aaf834e374bd941807cc05400716ad552f6bd36f216"

  #  go_resource "github.com/aws/aws-sdk-go" do
  #    url "https://github.com/aws/aws-sdk-go.git",
  #      revision: "f4b2120243b92fc47d6a4af71b854b8d5f4de8b5"
  #  end

  #  go_resource "gopkg.in/yaml.v2" do
  #    url "https://gopkg.in/yaml.v2",
  #      revision: "a3f3340b5840cee44f372bddb5880fcbc419b46a"
  #  end
  #end

  depends_on "go" => :build

  def install
    system "mv", "maekawa_darwin_amd64", "maekawa"
    bin.install "maekawa"
  end

  test do
    #system "go" "test"
  end
end
