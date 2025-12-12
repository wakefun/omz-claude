# omz-claude

一个为 [Claude Code](https://code.claude.com) CLI 提供 tab 补全功能的 oh-my-zsh 插件。

## 功能特性

- 完整的 `claude` CLI 选项和命令补全
- `--settings` 参数动态补全 `~/.claude/settings.*.json` 配置文件
- 快捷模式：直接输入配置名即可展开为完整的 `--settings` 路径
- 跨平台支持 (macOS, Linux)

## 环境要求

- [oh-my-zsh](https://ohmyz.sh/)
- [Claude Code CLI](https://code.claude.com)

## 安装

### 一键安装

```sh
curl -fsSL https://raw.githubusercontent.com/wakefun/omz-claude/main/install.sh | bash && source ~/.zshrc
```

安装脚本会尝试在 `~/.zshrc` 的 `plugins=(...)` 行中自动添加 `claude`，并生成备份 `~/.zshrc.omz-claude.bak`。  
如果你的插件管理方式不同，请手动把 `claude` 加到插件列表里。

### 手动安装

```sh
git clone https://github.com/wakefun/omz-claude.git
cp -r omz-claude/claude ~/.oh-my-zsh/custom/plugins/
```

## 使用方法

### 选项补全

```sh
claude --<TAB>          # 列出所有可用选项
claude --output-<TAB>   # 补全到 --output-format
```

### 命令补全

```sh
claude <TAB>            # 列出所有命令 (mcp, plugin, doctor 等)
claude m<TAB>           # 补全到 'mcp'
claude up<TAB>          # 补全到 'update'
```

### 配置文件补全

```sh
claude --settings <TAB>   # 列出所有配置文件
claude --settings k<TAB>  # 补全到 ~/.claude/settings.kimi.json
```

### 快捷模式（推荐）

直接输入配置名，无需 `--settings`，快速切换不同的 Claude 配置：

```sh
claude k<TAB>    # 展开为: claude --settings ~/.claude/settings.kimi.json
claude oa<TAB>   # 展开为: claude --settings ~/.claude/settings.oaipro.json
```

快捷配置和命令补全为“前缀匹配”，例如输入 `k<TAB>` 只会匹配以 `k` 开头的配置或命令。

## 配置文件规范

插件会自动扫描 `~/.claude/` 目录下符合命名规则的配置文件：

```text
路径: ~/.claude/settings.<配置名>.json
```

示例：

| 文件名 | 配置名 | 快捷输入 |
|--------|--------|----------|
| `settings.kimi.json` | kimi | `claude k<TAB>` |
| `settings.oaipro.json` | oaipro | `claude oa<TAB>` |
| `settings.deepseek.json` | deepseek | `claude d<TAB>` |

创建新配置后，无需重启终端，补全列表会自动更新。

## 文件结构

```
claude/
├── _claude            # 补全脚本
└── claude.plugin.zsh  # 插件入口
```

## 支持的命令

| 命令 | 描述 |
|------|------|
| `mcp` | 配置和管理 MCP 服务器 |
| `plugin` | 管理 Claude Code 插件 |
| `setup-token` | 设置认证令牌 |
| `doctor` | 检查自动更新器健康状态 |
| `update` | 检查更新 |
| `install` | 安装 Claude Code 原生构建 |

## 许可证

MIT
