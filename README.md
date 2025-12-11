# omz-claude

An oh-my-zsh plugin providing tab completion for the [Claude Code](https://claude.ai/claude-code) CLI.

## Features

- Full tab completion for all `claude` CLI options and commands
- Dynamic completion for `--settings` with `~/.claude/settings.*.json` files
- Shortcut mode: type config name directly to expand to full `--settings` path
- Cross-platform support (macOS, Linux)

## Requirements

- [oh-my-zsh](https://ohmyz.sh/)
- [Claude Code CLI](https://claude.ai/claude-code)

## Installation

1. Clone or download this repository:

```sh
git clone https://github.com/your-username/omz-claude.git
```

2. Copy the `claude` directory to your oh-my-zsh custom plugins:

```sh
cp -r omz-claude/claude ~/.oh-my-zsh/custom/plugins/
```

3. Add `claude` to your plugins list in `~/.zshrc`:

```sh
plugins=(... claude)
```

4. Reload your shell:

```sh
source ~/.zshrc
```

## Usage

### Option Completion

```sh
claude --<TAB>          # List all available options
claude --output-<TAB>   # Complete to --output-format
```

### Command Completion

```sh
claude <TAB>            # List all commands (mcp, plugin, doctor, etc.)
claude m<TAB>           # Complete to 'mcp'
claude up<TAB>          # Complete to 'update'
```

### Settings File Completion

```sh
claude --settings <TAB>   # List all settings files from ~/.claude/settings.*.json
claude --settings k<TAB>  # Complete to ~/.claude/settings.kimi.json
```

### Shortcut Mode

Type the config name directly without `--settings`:

```sh
claude k<TAB>    # Expands to: claude --settings ~/.claude/settings.kimi.json
claude oa<TAB>   # Expands to: claude --settings ~/.claude/settings.oaipro.json
```

This works by matching against the middle part of `settings.*.json` filenames in `~/.claude/`.

## File Structure

```
claude/
├── _claude            # Completion script
└── claude.plugin.zsh  # Plugin entry point
```

## Supported Commands

| Command | Description |
|---------|-------------|
| `mcp` | Configure and manage MCP servers |
| `plugin` | Manage Claude Code plugins |
| `setup-token` | Set up authentication token |
| `doctor` | Check auto-updater health |
| `update` | Check for updates |
| `install` | Install Claude Code native build |

## License

MIT
