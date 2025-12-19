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
