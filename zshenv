if [ -d "$HOME/bin" ] && [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  PATH="$PATH:$HOME/.local/bin"
fi

if [ -d "$HOME/.node_modules/bin" ] && [[ ":$PATH:" != *":$HOME/.node_modules/bin:"* ]]; then
  PATH="$PATH:$HOME/.node_modules/bin"
fi

export PATH
