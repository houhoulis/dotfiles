local GITCONTRIB=/usr/local/share/git-core/contrib
PATH=/Users/c/bin:$GITCONTRIB:$GITCONTRIB/contacts:$GITCONTRIB/diff-highlight:$GITCONTRIB/git-jump:$GITCONTRIB/stats:$GITCONTRIB/subtree:$GITCONTRIB/workdir:$PATH

export HOMEBREW_NO_INSTALL_CLEANUP=wtfofcoursenot
export HITHERE="hi there"
# tweak for Apple Developer Tools in 10.15 Catalina
#export CPATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include:/usr/local/include
#export LIBRARY_PATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib:/usr/local/lib

if type brew &>/dev/null; then
  FPATH=/usr/local/share/zsh/site-functions:/Users/c/.zsh:$FPATH

  autoload -Uz compinit
  compinit
fi
# autoload -Uz compinit && compinit
# rm -f ~/.zcompdump; compinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_'⚡·›'
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

# zsh completion wrapper for git
#
# [...]
#
# The recommended way to install this script is to make a copy of it in
# ~/.zsh/ directory as ~/.zsh/git-completion.zsh and then add the following
# to your ~/.zshrc file:
#
#  fpath=(~/.zsh $fpath)
# fpath=(~/.zsh $fpath)

alias cat=bat
alias ll="ls -alF"
alias cdd="cd ~/d"
alias mv="mv -i"
. /Users/c/d/dotfiles/.dev_aliases
. /Users/c/d/dotfiles/.git_aliases
. /Users/c/d/dotfiles/.rvmprof

# alias pry="pry -r ./config/environment"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add `jump`, `mark`, and `marks` commands to make filesystem navigation shortcuts.
# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump {
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
  rm -i "$MARKPATH/$1"
}
function marks {
  ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}
# doesn't seem to actually work in zsh
# complete -F _completemarks jump unmark


# The following two lines make it so that up and down arrow
# in bash is a filtered search through history based on the
# characters you've entered in your prompt
# For example: typing g then up arrow will iterate through
# your history of commands that  started with g.
# The more characters you type the more specific the search is.
# To revert to normal up/down arrow functionality just
# don't type anything before using the arrow keys
# bind '"\e[A": history-search-backward' #up-arrow through history
# bind '"\e[B": history-search-forward' #down-arrow through history
if [[ $_ = *irb ]]; then
  echo "wow, you doin' Ruby!"
else
  bindkey '\e[A' history-search-backward #up-arrow through history
  bindkey '\e[B' history-search-forward #down-arrow through history
fi

# https://stackoverflow.com/q/11670935 'or try bindkey "^Q" push-input'
setopt interactivecomments

#function parse_git_dirty {
#  if git log &> /dev/null; then
#    git_prompt="(";
#    [[ "$(git status | tail -1 2> /dev/null)" != *nothing\ to\ commit,\ working\ tree\ clean* ]] && git_prompt="$git_prompt * ";
#    echo "$git_prompt$(parse_git_branch))"
#  fi
#}
#
#function parse_git_branch {
#  ref=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e '/^[ *]*/s///')
#  if [[ $ref != '' ]]; then
#    echo "$ref"
#  fi
#}

#ORANGE=$(tput setaf 172)
## ⮀ ± ⭠ ➦ ✔ ✘ ⚡
## alt-shift-9 ·, alt-shift-4 ›
#export PS1="\[\e]2;\w\a\[\e[0;35m\]\# \[\e[0;33m\]\W\[\e[0;32m\]\$(parse_git_dirty)\[\e[$ORANGE\]·›\[\e[0m\] "
#export PS1=$'\e[2m%;\w\a\[\e[0;35m\]\# \[\e[0;33m\]\W\[\e[0;32m\]\(arse_git_dirt)\[\e[$ORANGE\]·›\[\e[0m%\] '
#export PS1="%?%K{233}%F{magenta} %~ %F{24}h%F{29}i%F{#aaaa44}! %F{#9944aa}%k (⚡)%F{214}·› %f"
export PS1="%?%K{233}%F{magenta} %~ %F{24}h%F{29}i%F{#aaaa44}!%k ⚡%F{#9944aa}·› %f"


export HOMEBREW_NO_INSTALL_CLEANUP=wtfofcoursenot
alias brew='[[ -n "$HOMEBREW_NO_INSTALL_CLEANUP" ]] && brew'

PATH="$PATH:$HOME/.cargo/bin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
