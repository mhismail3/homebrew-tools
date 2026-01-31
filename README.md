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

### things3

CLI for Things 3 task management with rollback support. Designed for automation and agent use.

```bash
brew install things3
```

**Features:**
- Full CRUD operations for to-dos and projects
- Rollback support via snapshots
- Structured JSON output for automation
- Query by list, tag, project, area, deadlines
- Built-in rate limiting

**Quick Start:**

```bash
# Query items
things3 query                      # Today's items (default)
things3 query --list inbox         # Items in inbox
things3 query --projects           # All projects

# Add items
things3 add "Buy groceries"
things3 add "Call mom" --when today
things3 add-project "New Feature" --area "Work"

# Update items (requires auth)
things3 update <id> --title "New title"
things3 complete <id>

# Navigate in Things app
things3 show today
things3 show inbox

# Search
things3 search "meeting"

# Rollback
things3 snapshots list
things3 rollback <snapshot-id>
```

**Authentication:**

Some operations (update, complete, cancel) require an auth token:

1. Open Things 3 → Settings → General
2. Enable "Things URLs"
3. Copy the auth token

```bash
things3 auth setup YOUR_TOKEN_HERE
things3 auth test    # Verify it works
```

**Global Options:**

```bash
--json              # Output as JSON
--dry-run           # Show what would happen
--quiet             # Suppress non-essential output
--no-color          # Disable colored output
```

For full documentation, see the [things3-cli repository](https://github.com/mhismail3/things3-cli).

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
