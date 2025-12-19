# Homebrew Tools

Personal Homebrew tap for CLI tools.

## Installation

```bash
brew tap mhismail3/tools
brew install mistral-ocr
```

## Available Formulae

### mistral-ocr

Extract text from images using Mistral's OCR API.

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

## Development

### Local Testing

Test the formula locally before publishing:

```bash
brew install --build-from-source ./Formula/mistral-ocr.rb
brew test mistral-ocr
brew audit --new-formula mistral-ocr
```

### Uninstall

```bash
brew uninstall mistral-ocr
brew untap mhismail3/tools
```

## License

MIT License - see [LICENSE](LICENSE) file for details.
