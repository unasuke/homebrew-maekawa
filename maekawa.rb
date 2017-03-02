class Maekawa < Formula
  desc "client for AWS CloudWatch Events has idempotence."
  homepage "https://github.com/unasuke/maekawa"
  url "https://github.com/unasuke/maekawa/archive/v0.1.0.tar.gz"
  sha256 "2aefe28150bcbe5423c28aaf834e374bd941807cc05400716ad552f6bd36f216"

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
