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

### tron-twitter

Stateless Twitter/X CLI for the Tron agent. Wraps [twikit](https://github.com/d60/twikit) for search, trending, timelines, notifications, DMs, and posting — no API keys required.

```bash
brew install tron-twitter
```

**Features:**
- **Stateless by design**: credentials and state come from environment variables, nothing is written to disk
- **Vault-friendly**: caller owns credential storage; CLI has no path assumptions
- **Bookmark envelope**: `check-mentions` / `check-dms` return `{"items": [...], "state": {...}}` so callers can persist the new bookmark
- **JSON or text output** (`--format text`) for read commands

**Quick Start:**

```bash
# Cookies must be harvested from a signed-in browser session:
# DevTools → Application → Cookies → https://x.com → copy auth_token and ct0
export TRON_TWITTER_COOKIES='{"auth_token":"...","ct0":"..."}'

# Read operations
tron-twitter search "AI agents" --count 20
tron-twitter trending --category trending
tron-twitter timeline elonmusk --count 10
tron-twitter user elonmusk
tron-twitter notifications --type Mentions

# Stateful — pass state in, persist state out
OUT=$(TRON_TWITTER_STATE='{"last_mention_ts":0}' tron-twitter check-mentions)
echo "$OUT" | jq '.items'       # new mentions
echo "$OUT" | jq '.state'       # → persist back to your state store

# Write operations (require confirmation in agent workflows)
tron-twitter post "Hello from Tron"
tron-twitter reply 1234567890 "Great tweet!"
tron-twitter like 1234567890
tron-twitter follow elonmusk

# Validate session
tron-twitter auth status
```

**Cold start:**

There is no programmatic login. The `auth_token` and `ct0` values must come from a real browser session signed into x.com. Automated logins trip bot detection. Open x.com → DevTools → Application → Cookies → copy both values.

**Why environment variables?**

- No `~/.tron/` writes, no config files, no path assumptions
- Per-call scoping (inline `VAR=value cmd`) keeps cookies out of sibling tools
- Credential managers (e.g. the Tron vault) can pipe decrypted values in without ever touching the filesystem

For full documentation, see the [tron-twitter repository](https://github.com/mhismail3/tron-twitter).

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
