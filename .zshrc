# Source prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Include all separate files
for file in ~/.{path,exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add completion for hub functions
fpath=(~/.zsh_completions $fpath)

# Init z https://github.com/rupa/z
. ~/Development/Applications/z/z.sh
