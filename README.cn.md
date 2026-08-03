# omz-ai-profile

一个通过 Tab 切换 [Claude Code](https://code.claude.com) 配置文件和 [Codex CLI](https://developers.openai.com/codex/cli/) profile 的 oh-my-zsh 插件。

## 功能

- 动态匹配 Claude settings 和 Codex profile 文件
- 将配置名展开为对应的 `--settings` 或 `--profile` 参数
- Codex profile 可能导致 ChatGPT 登录失效时给出警告
- 新增配置文件后无需重启终端
- 支持 macOS 和 Linux

## 环境要求

- [oh-my-zsh](https://ohmyz.sh/)
- [Claude Code CLI](https://code.claude.com) 和/或 [Codex CLI](https://developers.openai.com/codex/cli/)

## 安装

### 一键安装

```sh
curl -fsSL https://raw.githubusercontent.com/wakefun/omz-ai-profile/main/install.sh | bash && source ~/.zshrc
```

安装脚本会尝试在 `~/.zshrc` 的 `plugins=(...)` 行中添加 `ai-profile`，并生成备份 `~/.zshrc.omz-ai-profile.bak`。
如果你的插件管理方式不同，请手动把 `ai-profile` 加到插件列表里。
只需启用 `ai-profile` 这一个插件，它会同时为 `claude` 和 `codex` 命令注册匹配功能。

从 `omz-claude` 升级时，请在插件列表中把 `claude` 替换为 `ai-profile`，并重新安装到新的插件目录。

### 手动安装

```sh
git clone https://github.com/wakefun/omz-ai-profile.git
cp -r omz-ai-profile/ai-profile ~/.oh-my-zsh/custom/plugins/
```

## Claude Code

配置文件必须符合以下命名规则：

```text
~/.claude/settings.<配置名>.json
```

输入配置名后按 Tab：

```sh
claude k<TAB>    # claude --settings ~/.claude/settings.kimi.json
claude oa<TAB>   # claude --settings ~/.claude/settings.oaipro.json
```

在 `--settings` 后也可以使用相同的匹配：

```sh
claude --settings k<TAB>  # claude --settings ~/.claude/settings.kimi.json
```

## Codex CLI

Codex profile 文件必须符合以下命名规则，并放在 `$CODEX_HOME` 下（默认为 `~/.codex`）：

```text
~/.codex/<配置名>.config.toml
```

输入 profile 名后按 Tab：

```sh
codex deep<TAB>             # codex --profile deep-review
codex --profile deep<TAB>   # codex --profile deep-review
codex -p deep<TAB>          # codex -p deep-review
```

包含以下任一配置的 profile 会被标记警告，因为它们可能使当前 ChatGPT 登录失效：

```toml
preferred_auth_method = "apikey" # 旧版配置
forced_login_method = "api"
```

输入的前缀仅匹配到一个此类 profile 时，shell 还会在命令执行前显示醒目警告。

## 文件结构

```text
ai-profile/
├── _claude            # Claude 配置文件匹配
├── _codex             # Codex profile 匹配及认证警告
└── ai-profile.plugin.zsh  # 注册两个命令
```

## 许可证

MIT
