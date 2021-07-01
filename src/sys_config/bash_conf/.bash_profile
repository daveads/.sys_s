
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load default the .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"


if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi


#"if command -v pyenv 1>/dev/null 2>&1; then
#	eval "$(pyenv init -)"
# fi"


# pyenv 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


