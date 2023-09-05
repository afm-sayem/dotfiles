# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
DISABLE_AUTO_UPDATE="true"
UPDATE_ZSH_DAYS=13
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/afmsayem/.oh-my-zsh"

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git nvm taskwarrior)
source $ZSH/oh-my-zsh.sh

# User configuration
eval "$(/opt/homebrew/bin/brew shellenv)"
alias vi="vim"
alias vi="nvim"
alias rustdoc="rustup doc --toolchain=stable-x86_64-apple-darwin"
# alias love="/Applications/love.app/Contents/MacOS/love"
# alias pico8="/Applications/PICO-8.app/Contents/MacOS/pico8"

bindkey "^R" history-incremental-search-backward

## fancy ctrl-z http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ASDF
. /opt/homebrew/opt/asdf/libexec/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh

# ANDROID HOME
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

# POSTGRESAPP
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/13/bin
### Codex CLI setup - start
export CODEX_CLI_PATH=/Users/afmsayem/.oh-my-zsh/custom/plugins/codex-cli
source "$CODEX_CLI_PATH/scripts/zsh_plugin.zsh"
bindkey '^G' create_completion
### Codex CLI setup - end

# bun completions
[ -s "/Users/afmsayem/.bun/_bun" ] && source "/Users/afmsayem/.bun/_bun"

# deno
export DENO_INSTALL="/Users/afmsayem/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
