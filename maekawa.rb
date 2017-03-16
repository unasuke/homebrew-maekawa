class Maekawa < Formula
  desc "client for AWS CloudWatch Events has idempotence."
  homepage "https://github.com/unasuke/maekawa"
  url "https://github.com/unasuke/maekawa/archive/v0.4.0.tar.gz"
  sha256 "c075082744ba0c84bfb3ef7a760a1296eb07a3d5742629ddf20802e4b27dbb60"

  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
    (buildpath/"src/github.com/unasuke/maekawa").install buildpath.children
    cd "src/github.com/unasuke/maekawa" do
      system "glide", "install"
      system "go", "build", "-o", "maekawa"
      bin.install "maekawa"
    end
  end

  test do
    # system "go" "test"
  end
end
