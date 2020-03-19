source ~/.zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Plugins
antigen bundle twang817/zsh-ssh-agent

# Tell Antigen that you're done.
antigen apply

export PATH="$HOME/.pyenv/bin:$HOME/.poetry/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH:$HOME/.local/bin"

export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

unsetopt share_history

mdread () { pandoc $* | lynx -stdin }

bindkey "5C" forward-word
bindkey "5D" backward-word

alias sudo='sudo -E'
fpath+=~/.zfunc

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(ssh-agent)"

eval "$(thefuck --alias)"
