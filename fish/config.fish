# # Default stanza in fresh fish shell 3.5 install:
# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end


# By default, Ctrl-D closes terminal tabs if the command line is empty.
# I don't want that behavior. I'd ideally have only the bash default behavior.
bind --erase --all \cd
# (Putting this bind statement in a fish_user_key_bindings function, as the docs seem to suggest, has no effect.)

# Configure Homebrew, including disabling automatic behavior. https://docs.brew.sh/Manpage#environment
set -x HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK wtfofcoursenot
set -x HOMEBREW_NO_INSTALL_CLEANUP wtfofcoursenot
set -x HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS 36524.25 # 100 years in days, on average 🙃
set -x HOMEBREW_NO_AUTO_UPDATE 1
# Not going to try this since they don't support or respect my usage:
# set -x HOMEBREW_INSTALL_FROM_API 1 # they want us to try it; https://brew.sh/2022/09/07/homebrew-3.6.0/
set -x HOMEBREW_NO_ANALYTICS 1

set -x HITHERE "hi there"
set -x EDITOR vim
set -x MARKPATH "$HOME/.marks"
set -x NVM_DIR "$HOME/.nvm"
set -x FISH_CONFIG_PATH "$HOME/.config/fish"
# these two from Jason Axelson, https://jasonaxelson.com/talks/elixirconf2022
# To enable: iex> open Enum.map
set -x ELIXIR_EDITOR "codium --goto __FILE__:__LINE__"
# To keep input history across iex sessions:
set -x ERL_AFLAGS "-kernel shell_history enabled"

set _gitcontrib /usr/local/share/git-core/contrib
set --path -x PATH "$HOME/bin:$HOME/.cargo/bin:$HOME/.mix/escripts:$HOME/.rvm/bin:$_gitcontrib:$_gitcontrib/contacts:$_gitcontrib/diff-highlight:$_gitcontrib/git-jump:$_gitcontrib/stats:$_gitcontrib/subtree:$_gitcontrib/workdir:$HOME/Library/Python/3.10/bin:/Library/Apple/usr/bin:/System/Library/Tcl/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH"
# I don't know why this was added:
# set --path -x PATH "/Users/chrish/.cpan/build/App-cpanminus-1.7046-0/blib/script"
set --erase _gitcontrib

# See https://rvm.io/integration/fish
#CJH rvm default
rvm > /dev/null

abbr -a -g rvminfo "rvm info | tail"

abbr cdd cd ~/d

# git
abbr git12 "git log --decorate | head -n 12"
abbr git25 "git log --decorate | head -n 25"
abbr git1 "git log --decorate | head -n 1"

abbr gits "git status"
set _gitss "git status -uno && git log --decorate | head -n 6"
abbr gitss $_gitss
abbr gitcm "git checkout main && $_gitss"
abbr gitcd "git checkout development && $_gitss"
abbr gitcms "git checkout master && $_gitss"
set --erase _gitss

abbr gitdf "git diff --diff-algorithm=minimal"
abbr gitdc "git diff --cached --diff-algorithm=minimal"
abbr githeads "git diff HEAD~1 HEAD"
abbr gitap "git add -p"
abbr gitme "git log --no-color | rg -A4 -B1 ouhou | more"

set _gitsli 'git stash list --since="12 months ago" --format="%Cblue%h %Cgreen%gd %Cred%ai %Creset%d %Cgreen%s %Cblue%gn"'
abbr gitsli $_gitsli
abbr gitslih "$_gitsli | head -15"
set --erase _gitsli

abbr gitsap "git stash apply"
abbr gitspo "git stash pop"
abbr gitspop "git stash pop"
abbr gitcp "git cherry-pick -x"
abbr gitlo "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
abbr gitbd "git log --left-right --graph --cherry-pick --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
abbr gitgr "git log --graph --full-history --all --color --pretty=format:'%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s %C(blue)(%ar) %C(yellow)<%an>%Creset'"
abbr gitref "git log -g --date=format:'%Y%m%d %H%m%S' --pretty=format:'%Creset%C(yellow)%h %Cred%gd %C(yellow)%C(reverse)%gs%>|(108)%C(reverse)%Cblue%ad%Cgreen%an%Cblue%<|(165,trunc)%s%Cgreen%<(17,trunc)%D'"
abbr gitrecent "git branch -vv --sort=-authordate"
abbr gitrh "git branch -vv --sort=-authordate | head -15"
abbr gitdu "git rev-list --objects --all | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | sed -n 's/^blob //p' | gsort -rV --key=2 | cut -c 1-12,41- | gnumfmt --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest | less"

# ruby
abbr be "bundle exec"
abbr berk "bundle exec rake"
abbr bemigr "time bundle exec rake --trace db:migrate"
abbr bestat "bundle exec rake db:migrate:status"
abbr beroll "bundle exec rake --trace db:rollback"
abbr bedown "bundle exec rake db:migrate:status | rg --column ' down '"
abbr bert "bundle exec rake test"
abbr bertr "bundle exec rake test:recent"
abbr bertf "bundle exec rake test:functionals"
abbr bertu "bundle exec rake test:units"
abbr besp "bundle exec rspec"
abbr bespm "bundle exec rspec spec/models"
abbr bespc "bundle exec rspec spec/controllers"
abbr bespv "bundle exec rspec spec/views"
abbr berl "bundle exec rails"
abbr berc "bundle exec rails c"
abbr bers "bundle exec rails s"
# alias pry="pry -r ./config/environment"

# rust
abbr ct "hr v ; cargo test -- --test-threads=1 --nocapture --color always" # see `brew info hr`

# fd
set -l FD_OPTIONS "--hidden --exclude .git/ --exclude node_modules/"
abbr fd "fd $FD_OPTIONS"

# fzf
set -x FZF_DEFAULT_COMMAND "git ls-files --cached --modified --others --exclude-standard | fd $FD_OPTIONS"
set -x FZF_DEFAULT_OPTS "--info=inline --height 55% --preview 'bat --style=numbers --color=always {} || cat {}' --reverse --cycle --multi --bind='ctrl-y:execute-silent(echo {+} | pbcopy)' --border"
fzf_configure_bindings

# dust
abbr du "dust -prs -d 1"
abbr dust "dust -prs -d 1"

# btop
abbr top btop

abbr which where

abbr rg "rg --hidden --unrestricted --no-ignore --no-require-git --max-columns=500 --max-columns-preview -g '!.git/**' -g '!node_modules/**'"

# Pull in a local config file, if it exists, for stuff that needs to be .gitignored
# Overwrite config above in this file.
if test -f ~/.config/fish/config.local.fish
  . ~/.config/fish/config.local.fish
end
