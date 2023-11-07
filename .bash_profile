# First path, because we use things in the PATH
export PATH="$PATH:/Library/Frameworks/GDAL.framework/Programs:/$BUN_INSTALL/bin:$VOLTA_HOME/bin:usr/local/bin:/opt/homebrew/bin:$HOME/bin"

# Configure Go
export GOPATH=$(go env GOPATH)
# Configure Volta
export VOLTA_HOME="$HOME/.volta"

# Configure bun
export BUN_INSTALL="$HOME/.bun"

# HashiCorp Path
export HASHICORP_PATH="$HOME/work/cloud-makefiles"

# Path all the things
export PATH="$PATH:$(go env GOPATH)/bin:$HASHICORP_PATH/bin"

# Configure NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.private is used for aliases and functions that aren't committed
for file in ~/.{path,bash_prompt,functions,private,cargo/env}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  complete -o default -o nospace -F _git g;
fi;

# Make Ctrl+S work
[ -n "$PS1" ] && stty -ixon;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

#
# Exports
#

export EDITOR="vim";

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

# Highlight section titles in manual pages
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X";

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto";

#
# Aliases
#

alias     ..='cd ../'
alias    ...='cd ../../'
alias   ....='cd ../../../'
alias  .....='cd ../../../../'
alias ......='cd ../../../../../'

alias nom='rm -rf node_modules && npm cache clear && npm install'
alias yom='rm -rf node_modules && yarn cache clean && yarn'
alias cd-nomad='cd ~/go/src/github.com/hashicorp/nomad'

alias e='ember $@'
alias et='ember test --server --filter "$@"'
alias es='USE_MIRAGE=false ember server "$@"'
alias mes='ember server "$@"'

alias python='python3'
alias pip='pip3'
alias tf='terraform'
alias nmd='nomad'
