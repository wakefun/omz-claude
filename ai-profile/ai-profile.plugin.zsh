# omz-ai-profile: Claude Code and Codex profile switcher
fpath=("${0:A:h}" $fpath)
autoload -Uz _claude _codex
compdef _claude claude
compdef _codex codex
