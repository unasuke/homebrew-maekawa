class Maekawa < Formula
  desc "client for AWS CloudWatch Events has idempotence."
  homepage "https://github.com/unasuke/maekawa"
  url "https://github.com/unasuke/maekawa/archive/v0.3.0.tar.gz"
  sha256 "7057df1650f044666ad5073a519489ac3aaa2dd2ed7d2a62aca75add7fe1a54e"

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
