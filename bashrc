# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# bash_prompt

# Check that terminfo exists before changing TERM var to xterm-256color
# Prevents prompt flashing in Mac OS X 10.6 Terminal.app
if [ -e /usr/share/terminfo/x/xterm-256color  ] || [ -e ~/.terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else  
	export TERM='xterm'
fi

tput sgr 0 0
# Solarized colors
BOLD=$(tput bold)
RESET=$(tput sgr0)
SOLAR_YELLOW=$(tput setaf 136)
SOLAR_ORANGE=$(tput setaf 166)
SOLAR_RED=$(tput setaf 124)
SOLAR_MAGENTA=$(tput setaf 125)
SOLAR_VIOLET=$(tput setaf 61)
SOLAR_BLUE=$(tput setaf 33)
SOLAR_CYAN=$(tput setaf 37)
SOLAR_GREEN=$(tput setaf 64)
SOLAR_WHITE=$(tput setaf 254)

style_user="\[${RESET}${SOLAR_ORANGE}\]"
style_host="\[${RESET}${SOLAR_YELLOW}\]"
style_path="\[${RESET}${SOLAR_GREEN}\]"
style_chars="\[${RESET}${SOLAR_WHITE}\]"
style_branch="${SOLAR_CYAN}"


prompt_char="$"
if [[ "$SSH_TTY" ]]; then
	# connected via ssh
	style_host="\[${BOLD}${SOLAR_RED}\]"
elif [[ "$USER" == "root" ]]; then
	# logged in as root
	style_user="\[${BOLD}${SOLAR_RED}\]"
	prompt_char="#"
fi

# Git status.
# Adapted from: https://github.com/cowboy/dotfiles/
function prompt_git() {
	local status output flags
	status="$(git status 2>/dev/null)"
	[[ $? != 0 ]] && return;
	output="$(echo "$status" | awk '/# Initial commit/ {print "(init)"}')"
	[[ "$output" ]] || output="$(echo "$status" | awk '/# On branch/ {print $4}')"
	[[ "$output" ]] || output="$(git branch | perl -ne '/^\* (.*)/ && print $1')"
	flags="$(
	echo "$status" | awk 'BEGIN {r=""} \
		/^# Changes to be committed:$/ {r=r "+"}\
		/^# Changes not staged for commit:$/ {r=r "!"}\
		/^# Untracked files:$/ {r=r "?"}\
		END {print r}'
	)"
	if [[ "$flags" ]]; then
		output="$output[$flags]"
	fi
	echo -ne "${SOLAR_WHITE} ${style_branch}${output}"
}

# apparently bash has problems calling functions inside the PS1
PROMPT_GIT=$(prompt_git)
PS1=""
PS1+="${style_user}\u" # Username
PS1+="${style_chars}@" # @
PS1+="${style_host}\h" # Host
PS1+="${style_chars} " # :
PS1+="${style_path}\w" # Working directory
#PS1+="\[\$(prompt_git)\]" # Git details
PS1+="${style_chars} ${prompt_char} \[${RESET}\]" # $ (and reset color)

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	eval `dircolors ~/.dotfiles/solarized/dircolors/dircolors.ansi-dark`
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

EDITOR=/usr/bin/vim
VISUAL=/usr/bin/vim
set -o vi

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# aliases
alias i='info --vi-keys'
alias ack='ack-grep'
alias mc='mc -S ~/.dotfiles/misc/solarized.ini'
alias dirs='dirs -v'
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias -- -="cd -"
alias ll='ls -alF'
alias lh='ls -ltrah'
alias l='ls -ltr'
alias ssh='TERM=xterm ssh '
alias sshx='TERM=xterm-256color ssh '

# git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gh='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

# maven
MAVEN_HOME=/usr/share/maven3
PATH=$MAVEN_HOME/bin:$PATH

# clang
CLANG_BIN=~/opt/build/Release+Asserts/bin
PATH=$CLANG_BIN:$PATH
# clang tools
SCANBUILD=~/opt/llvm/tools/clang/tools/scan-build
SCANVIEW=~/opt/llvm/tools/clang/tools/scan-view
PATH=$SCANBUILD:$SCANVIEW:$PATH

# scala
SBT_HOME=~/playpen/scala/sbt
PATH=$SBT_HOME/bin:$PATH

export ORACLE_HOME=~/opt/instantclient_11_2
export PATH=$PATH:$ORACLE_HOME
export LD_LIBRARY_PATH=$ORACLE_HOME

LATEX_HOME=/usr/local/texlive/2012/bin/x86_64-linux
PATH=$LATEX_HOME:$PATH

# local alias
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# bash completion
[[ $PS1 && -f ~/.dotfiles/bash-completion/bash_completion.sh ]] && \
	. ~/.dotfiles/bash-completion/bash_completion.sh
. ~/.dotfiles/misc/git-completion.bash
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

