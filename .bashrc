# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# ~~~~~ HISTORY ~~~~~ #
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%F %T "

# append history to the history file after each command, good for multiple terminals
PROMPT_COMMAND='history -a'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=10000000

# ~~~~~ /HISTORY ~~~~~ #

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

# ~~~~~ ADD GIT TO PROMPT ~~~~~ #
if [ "$color_prompt" = yes ]; then
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w$(__git_ps1)\[\033[00m\]\$ '
else
	#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1)\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# short names
alias t='tmux'
alias n='nvim'
alias py="python3"
alias python="python3"
alias ta='terraform apply -auto-approve'
alias venv='python3 -m venv .venv && source .venv/bin/activate'

# git
alias gits="git status"
alias gita="git add"
alias gitc="git commit -m"

# Alias dotfiles to manage ~/.dotfiles git repo
alias dotfiles='/usr/bin/git --git-dir=/home/austin/.dotfiles/ --work-tree=/home/austin'

# Prompt user before deleting crontab
alias crontab='crontab -i'

# common tasks
alias update='sudo -- sh -c "apt update && apt -y upgrade && apt -y --purge autoremove && sudo apt -y clean"'
alias sync_notes='unison -auto -batch ssh://austin@74.208.5.220/Sync/ /home/austin/Sync/'
alias simula='cd Simula && ./result/bin/simula'

# ssh aliases
alias ssh-personal="ssh austin@74.208.5.220"
alias ssh-ajrc='ssh amwilkins@82.165.214.26'
alias ssh-ajrc-root='ssh root@82.165.214.26'
alias ssh-shared-root='ssh root@74.208.226.72'
alias ssh-shared='ssh awilkins@74.208.226.72'
alias ssh-scrape-austin='ssh awilkins@198.71.48.21'
alias ssh-wiki='ssh root@216.250.118.59'

# Only works on personal-server
alias ssh-home='ssh localhost -p 8022'

# Import other alias file.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# ~~~~~~~~~ ENV STUFF~~~~~~~~~~~~~#
# new python path
PYTHONPATH=/home/austin/.local/bin:${PYTHONPATH}
export PYTHONPATH

# added for android emulator https://docs.mitmproxy.org/stable/howto-install-system-trusted-ca-android/
export PATH=$PATH:$HOME/Android/Sdk/platform-tools
export PATH=$PATH:$HOME/Android/Sdk/emulator

# Add amdgpu utils
export PATH=$PATH:/opt/rocm-6.3.1/bin

# bash scripts
export PATH="$HOME/bin:$PATH"

# neovim
export PATH="$PATH:/opt/nvim-linux64/bin"

# terradata autocomplete
complete -C /home/austin/Sync/bin/terraform terraform

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
