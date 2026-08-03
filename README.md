# omz-ai-profile

An oh-my-zsh plugin for switching [Claude Code](https://code.claude.com) settings files and [Codex CLI](https://developers.openai.com/codex/cli/) profiles with Tab.

## [说明文档](README.cn.md)

## Features

- Dynamically matches Claude settings and Codex profile files
- Expands names to the corresponding `--settings` or `--profile` argument
- Warns when a Codex profile can invalidate a ChatGPT login
- Detects new configuration files without restarting the terminal
- Supports macOS and Linux

## Requirements

- [oh-my-zsh](https://ohmyz.sh/)
- [Claude Code CLI](https://code.claude.com) and/or [Codex CLI](https://developers.openai.com/codex/cli/)

## Installation

### One-line Install

```sh
curl -fsSL https://raw.githubusercontent.com/wakefun/omz-ai-profile/main/install.sh | bash && source ~/.zshrc
```

The installer will try to add `ai-profile` to your `plugins=(...)` line in `~/.zshrc` and create a backup at `~/.zshrc.omz-ai-profile.bak`.
If your plugins are managed differently, add `ai-profile` manually.
The single `ai-profile` plugin entry registers matching for both the `claude` and `codex` commands.

When upgrading from `omz-claude`, replace `claude` with `ai-profile` in your plugin list and reinstall into the new plugin directory.

### Manual Install

```sh
git clone https://github.com/wakefun/omz-ai-profile.git
cp -r omz-ai-profile/ai-profile ~/.oh-my-zsh/custom/plugins/
```

## Claude Code

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

## Codex CLI

Codex profile files must follow this pattern under `$CODEX_HOME` (defaults to `~/.codex`):

```text
~/.codex/<name>.config.toml
```

Type a profile name and press Tab:

```sh
codex deep<TAB>             # codex --profile deep-review
codex --profile deep<TAB>   # codex --profile deep-review
codex -p deep<TAB>          # codex -p deep-review
```

Profiles containing either of these assignments are marked with a warning because they can invalidate an active ChatGPT login:

```toml
preferred_auth_method = "apikey" # Legacy configuration
forced_login_method = "api"
```

When a typed prefix uniquely matches one of these profiles, the shell also displays an explicit warning before you run the command.

## File Structure

```text
ai-profile/
├── _claude            # Claude settings matcher
├── _codex             # Codex profile matcher and auth warning
└── ai-profile.plugin.zsh  # Registers both commands
```

## License

MIT
