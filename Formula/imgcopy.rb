class Imgcopy < Formula
  desc "Multi-provider image text extraction with auto-formatting and cleanup"
  homepage "https://github.com/mhismail3/homebrew-tools"
  url "https://github.com/mhismail3/homebrew-tools/archive/refs/tags/imgcopy-v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"

  depends_on "python@3.11"

  def install
    bin.install "bin/imgcopy"
  end

  def caveats
    <<~EOS
      imgcopy supports multiple vision AI providers:
        - Mistral (default, most cost-effective for OCR)
        - OpenAI (GPT-4o Vision)
        - Anthropic (Claude 3.5 Sonnet)
        - Google Gemini

      Set the appropriate API key environment variable:
        export MISTRAL_API_KEY="your-key"      # Default provider
        export OPENAI_API_KEY="your-key"
        export ANTHROPIC_API_KEY="your-key"
        export GEMINI_API_KEY="your-key"

      Get API keys:
        Mistral:   https://console.mistral.ai/api-keys
        OpenAI:    https://platform.openai.com/api-keys
        Anthropic: https://console.anthropic.com/settings/keys
        Gemini:    https://aistudio.google.com/app/apikey

      Quick start:
        imgcopy screenshot.png              # Extract text
        imgcopy document.jpg --clean        # Clean + copy to clipboard
        imgcopy photo.png -p openai --clean # Use OpenAI
    EOS
  end

  test do
    assert_match "Multi-provider image text extraction", shell_output("#{bin}/imgcopy --help")
  end
end
