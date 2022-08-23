# Source global definitions

# Fedora based distributions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Debian based distributions
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# source rust env file (present here when rust is installed without the distro package manager)
if [ -f ~/.cargo/env ]; then
		. "$HOME/.cargo/env"
fi

# DISPLAYED INFORMATIONS
#  \t - time
#  \d - date
#  \n - newline
#  \s - shell name
#  \W - current working directory
#  \w - full path of the current working directory.
#  \u - user name
#  \h - hostname
#  \# - command number of this command.
#  \! - history number of the current command
#
# COLORS
#   \[\e[1;32m\] = bold light green
#   \[\e[1;34m\] = bold light blue
#   \[\e[0m\]    = reset
#
PS1='[\u@\h \W]\$ '
