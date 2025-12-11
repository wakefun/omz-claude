# omz-claude

一个为 [Claude Code](https://claude.ai/claude-code) CLI 提供 tab 补全功能的 oh-my-zsh 插件。

## 功能特性

- 完整的 `claude` CLI 选项和命令补全
- `--settings` 参数动态补全 `~/.claude/settings.*.json` 配置文件
- 快捷模式：直接输入配置名即可展开为完整的 `--settings` 路径
- 跨平台支持 (macOS, Linux)

## 环境要求

- [oh-my-zsh](https://ohmyz.sh/)
- [Claude Code CLI](https://claude.ai/claude-code)

## 安装

1. 克隆或下载本仓库：

```sh
git clone https://github.com/your-username/omz-claude.git
```

2. 将 `claude` 目录复制到 oh-my-zsh 自定义插件目录：

```sh
cp -r omz-claude/claude ~/.oh-my-zsh/custom/plugins/
```

3. 在 `~/.zshrc` 中添加 `claude` 到插件列表：

```sh
plugins=(... claude)
```

4. 重新加载 shell：

```sh
source ~/.zshrc
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
claude --settings <TAB>   # 列出 ~/.claude/settings.*.json 中的所有配置文件
claude --settings k<TAB>  # 补全到 ~/.claude/settings.kimi.json
```

### 快捷模式

直接输入配置名，无需 `--settings`：

```sh
claude k<TAB>    # 展开为: claude --settings ~/.claude/settings.kimi.json
claude oa<TAB>   # 展开为: claude --settings ~/.claude/settings.oaipro.json
```

快捷模式通过匹配 `~/.claude/` 目录下 `settings.*.json` 文件名的中间部分实现。

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
