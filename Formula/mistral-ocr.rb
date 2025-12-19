class MistralOcr < Formula
  desc "Extract text from images using Mistral's OCR API"
  homepage "https://github.com/mhismail3/homebrew-tools"
  url "https://github.com/mhismail3/homebrew-tools/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"

  depends_on "python@3.11"

  def install
    bin.install "bin/mistral-ocr"
  end

  def caveats
    <<~EOS
      mistral-ocr requires the MISTRAL_API_KEY environment variable to be set.
      Get your API key at: https://console.mistral.ai/api-keys

      Add to your shell profile:
        export MISTRAL_API_KEY="your-api-key-here"
    EOS
  end

  test do
    assert_match "Mistral OCR", shell_output("#{bin}/mistral-ocr --help")
  end
end
