# Homebrew Tools

Personal Homebrew tap for CLI tools.

## Quick Start

```bash
# Add this tap to Homebrew
brew tap mhismail3/tools

# Install any tool
brew install <tool-name>
```

## Available Tools

### imgcopy

Multi-provider image text extraction with auto-formatting and cleanup. Extract text from images using OpenAI, Anthropic, Gemini, or Mistral vision APIs.

```bash
brew install imgcopy
```

**Features:**
- **Multi-provider support**: OpenAI (GPT-4o), Anthropic (Claude 3.5), Gemini, Mistral (default)
- **Smart text cleanup**: Remove OCR artifacts, fix formatting, smart paragraph joining
- **Auto-copy to clipboard**: `--clean` flag formats and copies in one step
- **Flexible output**: stdout, file, or clipboard
- **Wide format support**: PNG, JPEG, WebP, AVIF, GIF, BMP
- **Files up to 50MB**

**Usage:**
```bash
# Basic usage (uses Mistral by default)
imgcopy screenshot.png

# Auto-clean and copy to clipboard
imgcopy document.jpg --clean

# Use specific provider
imgcopy photo.png -p openai --clean
imgcopy scan.jpg -p anthropic --clean

# Use specific model
imgcopy image.png -m gpt-4o-mini --clean

# Save to file
imgcopy document.jpg --clean -o output.txt
```

**Setup:**
Set the API key for your preferred provider(s):

```bash
# Mistral (default, most cost-effective for OCR)
export MISTRAL_API_KEY="your-key"

# OpenAI
export OPENAI_API_KEY="your-key"

# Anthropic
export ANTHROPIC_API_KEY="your-key"

# Google Gemini
export GEMINI_API_KEY="your-key"
```

**Get API Keys:**
- Mistral: https://console.mistral.ai/api-keys
- OpenAI: https://platform.openai.com/api-keys
- Anthropic: https://console.anthropic.com/settings/keys
- Gemini: https://aistudio.google.com/app/apikey

---

### mistral-ocr

Extract text from images using Mistral's OCR API.

```bash
brew install mistral-ocr
```

**Features:**
- Extract text from PNG, JPEG, WebP, and AVIF images
- Output to stdout, file, or clipboard
- Supports files up to 50MB
- Uses Mistral's latest OCR model

**Usage:**
```bash
# Basic usage
mistral-ocr image.jpg

# Copy to clipboard
mistral-ocr screenshot.png --copy

# Save to file
mistral-ocr document.jpg -o output.txt
```

**Requirements:**
- Set `MISTRAL_API_KEY` environment variable
- Get your API key at: https://console.mistral.ai/api-keys

**Setup:**
```bash
export MISTRAL_API_KEY="your-api-key-here"
```

---

## Development

### Adding a New Formula

1. Create a new formula file in `Formula/`:
```bash
touch Formula/your-tool.rb
```

2. Follow the [Homebrew formula cookbook](https://docs.brew.sh/Formula-Cookbook) for formula structure

3. Test locally:
```bash
brew install --build-from-source ./Formula/your-tool.rb
brew test your-tool
```

4. Commit and push to make it available

### Testing Formulae

```bash
# Install from local file
brew install --build-from-source ./Formula/<tool-name>.rb

# Test the formula
brew test <tool-name>

# Audit the formula
brew audit --new --strict <tool-name>
```

### Updating a Formula

1. Update the formula file (version, SHA256, etc.)
2. Create a new git tag for the version
3. Push changes and tag to GitHub
4. Reinstall to test:
```bash
brew reinstall <tool-name>
```

## License

MIT License - see [LICENSE](LICENSE) file for details.
