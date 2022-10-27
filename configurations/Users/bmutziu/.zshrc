CLI="$HOME/.cli"
VSCODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PATH="$VSCODE:/opt/local/bin:$PATH"
# export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/Cellar/node@16/16.18.0/bin:$PATH"
export GOPATH="$(go env GOPATH)"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$GOPATH/bin:${GOROOT}/bin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"
export ZSH="$HOME/.oh-my-zsh"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

eval "$(zoxide init zsh)"

# ITERM bindings
# changes hex 0x15 to delete everything to the left of the cursor, rather than the whole line
# bindkey "^U" backward-kill-line
# binds hex 0x18 0x7f with deleting everything to the left of the cursor
# bindkey "^X\\x7f" backward-kill-line
# adds redo
# bindkey "^X^_" redo

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="nvim"
export HISTSIZE=4000
export SAVEHIST=5000

setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt appendhistory           # Immediately append history instead of overwriting
setopt nobeep                  # No beep

#Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
#Initialization code that may require console input (password prompts, [y/n]
#confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

brew_prefix="$(brew --prefix)"

#source $brew_prefix/opt/powerlevel10k/powerlevel10k.zsh-theme
#source $brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source $brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=( 
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    alias-finder
)

export ZSH="$HOME/.oh-my-zsh"

# Fix preview-tui
export PAGER='less -R'

source $ZSH/oh-my-zsh.sh
source $HOME/.p10k.zsh
source $HOME/.config/broot/launcher/bash/br
# source $HOME/.cargo/env

# export NVM_DIR="$HOME/.nvm"

# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source all profile files
for file in $HOME/.profile*; do
  source "$file"
done

# source /Users/bmutziu/.config/broot/launcher/bash/br

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# add autocomplete permanently to your zsh shell
[[ /opt/homebrew/bin/kubectl ]] && source <(kubectl completion zsh)

# google-cloud-sdk
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

# kubech
source ~/.kubech/kubech

# psql
# export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

autoload -U compinit && compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

