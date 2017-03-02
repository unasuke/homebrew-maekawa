class Maekawa < Formula
  desc "client for AWS CloudWatch Events has idempotence."
  homepage "https://github.com/unasuke/maekawa"
  url "https://github.com/unasuke/maekawa/archive/v0.2.0.tar.gz"
  sha256 "a120b995c4b695da2369850953e28ab4cd120e3b3ccb72c7028eee660eb70a95"

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
