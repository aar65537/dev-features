#!/usr/bin/bash

# Install uv with autocompletion
curl -LsSf https://astral.sh/uv/install.sh | sh
echo 'eval "$(uv generate-shell-completion zsh)"' >> $HOME/.zshrc

# Install python tooling
uv tool install basedpyright
uv tool install ruff

# Configure helix
echo '[[language]]
name = "python"
auto-format = true
language-servers = ["basedpyright",  "ruff"]

[language.formatter]
command = "ruff"
args = ["format", "-"]' > \
$HOME/.config/helix/languages.toml
