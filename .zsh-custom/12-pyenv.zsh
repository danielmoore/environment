pyenv=$(whence -p pyenv)
if [[ -n "$pyenv" ]]; then
  eval "$($pyenv init -)"
fi
