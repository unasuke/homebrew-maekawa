class Maekawa < Formula
  desc "client for AWS CloudWatch Events has idempotence."
  homepage "https://github.com/unasuke/maekawa"
  url "https://github.com/unasuke/maekawa/archive/v0.5.0.tar.gz"
  sha256 "1577ae8fe97b08510aeef791ec4cea1dc4ffd1193ebe47a24d567cc2721bf52f"

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
