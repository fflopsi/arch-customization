# Runcom file for zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Import config, key bindings and aliases, files need to be in the same directory
FILE=${0:a:h}/.zsh_config && test -f $FILE && source $FILE
FILE=${0:a:h}/.zsh_keymap && test -f $FILE && source $FILE
FILE=${0:a:h}/.zsh_aliases && test -f $FILE && source $FILE


# Syntax highlighting, needs to be as late as possible to work best
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
