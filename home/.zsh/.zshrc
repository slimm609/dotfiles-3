

#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
#setopt prompt_subst;
#zmodload zsh/datetime;
#PS4='+[$EPOCHREALTIME]%N:%i> ';
#set -x
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$ZDOTDIR/.zshrc'
# End of lines added by compinstall
#zstyle ':completion:*:*:git:*' user-commands fixup:'Create a fixup commit'

if [[ -s ${HOME}/Development/Applications/z/z.sh ]]; then
  . ${HOME}/Development/Applications/z/z.sh
fi

for file in ~/.{path,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# Start tmux
if [[ -z "$TMUX" ]]; then
  tmux attach -t Coolblue || tmux new -s Coolblue
fi
