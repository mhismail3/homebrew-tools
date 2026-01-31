class Things3 < Formula
  desc "CLI for Things 3 task management with rollback support"
  homepage "https://github.com/mhismail3/things3-cli"
  url "https://github.com/mhismail3/homebrew-tools/archive/refs/tags/things3-v1.0.0.tar.gz"
  sha256 "df2e55417045b08bf5fe7c6426d25991523b8a57cc44f2a14f7439fc9601bf9c"
  license "MIT"

  def install
    bin.install "bin/things3"
  end

  test do
    assert_match "CLI for Things 3", shell_output("#{bin}/things3 --help")
  end
end
