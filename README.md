# omz-claude

An oh-my-zsh plugin for switching between [Claude Code](https://code.claude.com) settings files with Tab.

## [说明文档](README.cn.md)

## Features

- Dynamically matches `~/.claude/settings.*.json` files
- Expands a settings name to the full `--settings` argument
- Detects new settings files without restarting the terminal
- Supports macOS and Linux

## Requirements

- [oh-my-zsh](https://ohmyz.sh/)
- [Claude Code CLI](https://code.claude.com)

## Installation

### One-line Install

```sh
curl -fsSL https://raw.githubusercontent.com/wakefun/omz-claude/main/install.sh | bash && source ~/.zshrc
```

The installer will try to add `claude` to your `plugins=(...)` line in `~/.zshrc` and create a backup at `~/.zshrc.omz-claude.bak`.
If your plugins are managed differently, add `claude` manually.

### Manual Install

```sh
git clone https://github.com/wakefun/omz-claude.git
cp -r omz-claude/claude ~/.oh-my-zsh/custom/plugins/
```

## Usage

Settings files must follow this pattern:

```text
~/.claude/settings.<name>.json
```

Type a settings name and press Tab:

```sh
claude k<TAB>    # claude --settings ~/.claude/settings.kimi.json
claude oa<TAB>   # claude --settings ~/.claude/settings.oaipro.json
```

The same matching works after `--settings`:

```sh
claude --settings k<TAB>  # claude --settings ~/.claude/settings.kimi.json
```

## File Structure

```text
claude/
├── _claude            # Settings matcher
└── claude.plugin.zsh  # Plugin entry point
```

## License

MIT
