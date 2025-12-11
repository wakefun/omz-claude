# claude oh-my-zsh plugin
fpath+=("${0:A:h}")
autoload -Uz _claude
compdef _claude claude
