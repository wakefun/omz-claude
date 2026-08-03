# omz-claude

一个通过 Tab 切换 [Claude Code](https://code.claude.com) 配置文件的 oh-my-zsh 插件。

## 功能

- 动态匹配 `~/.claude/settings.*.json` 文件
- 将配置名展开为完整的 `--settings` 参数
- 新增配置文件后无需重启终端
- 支持 macOS 和 Linux

## 环境要求

- [oh-my-zsh](https://ohmyz.sh/)
- [Claude Code CLI](https://code.claude.com)

## 安装

### 一键安装

```sh
curl -fsSL https://raw.githubusercontent.com/wakefun/omz-claude/main/install.sh | bash && source ~/.zshrc
```

安装脚本会尝试在 `~/.zshrc` 的 `plugins=(...)` 行中添加 `claude`，并生成备份 `~/.zshrc.omz-claude.bak`。
如果你的插件管理方式不同，请手动把 `claude` 加到插件列表里。

### 手动安装

```sh
git clone https://github.com/wakefun/omz-claude.git
cp -r omz-claude/claude ~/.oh-my-zsh/custom/plugins/
```

## 使用方法

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

## 文件结构

```text
claude/
├── _claude            # 配置文件匹配
└── claude.plugin.zsh  # 插件入口
```

## 许可证

MIT
