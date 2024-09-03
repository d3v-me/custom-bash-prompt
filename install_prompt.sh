#!/bin/bash

# Define the .bash_prompt content using EOF to avoid interpretation of special characters
BASH_PROMPT_CONTENT=$(cat <<'EOF'
# Define some basic colors using tput (8-bit color: 256 colors)
red="\[$(tput setaf 160)\]"
bright_red="\[$(tput setaf 196)\]"
light_purple="\[$(tput setaf 60)\]"
orange="\[$(tput setaf 172)\]"
blue="\[$(tput setaf 21)\]"
light_blue="\[$(tput setaf 80)\]"
bold="\[$(tput bold)\]"
reset="\[$(tput sgr0)\]"

# Define basic colors to be used in prompt
## The color for username (light_blue, for root user: bright_red)
username_color="${reset}${bold}${light_blue}\$([[ \${EUID} == 0 ]] && echo \"${bright_red}\")";
## Color of @ and ✗ symbols (orange)
at_color=$reset$bold$orange
## Color of host/pc-name (blue)
host_color=$reset$bold$blue
## Color of current working directory (light_purple)
directory_color=$reset$light_purple
## Color for other characters (like the arrow)
etc_color=$reset$red
# If last operation did not succeed, add [✗]- to the prompt
on_error="\$([[ \$? != 0 ]] && echo \"${etc_color}[${at_color}✗${etc_color}]─\")"
# The last symbol in prompt ($, for root user: #)
symbol="${reset}${bold}${bright_red}$(if [[ ${EUID} == 0 ]]; then echo '#'; else echo '$'; fi)"

# Setup the prompt/prefix for Linux terminal
PS1="${etc_color}┌─${on_error}[";
PS1+="${username_color}\u"; # \u=Username
PS1+="${at_color}@";
PS1+="${host_color}\h" #\h=Host
PS1+="${etc_color}]-[";
PS1+="${directory_color}\w"; # \w=Working directory
PS1+="${etc_color}]\n└──╼ "; # \n=New Line
PS1+="${symbol}${reset}";

export PS1
EOF
)

# Define the code to source .bash_prompt in .bashrc
BASHRC_SOURCE_CODE=$(cat <<'EOF'
# Use custom bash prompt (will execute .bash_prompt script)
if [ -f ~/.bash_prompt ]; then
  . ~/.bash_prompt
fi
EOF
)

# Create the .bash_prompt file in the user's home directory
echo "$BASH_PROMPT_CONTENT" > ~/.bash_prompt
echo ".bash_prompt created in the home directory."

# Check if .bashrc already sources .bash_prompt, and add it if not
if ! grep -q 'if [ -f ~/.bash_prompt ]; then . ~/.bash_prompt; fi' ~/.bashrc; then
  echo "$BASHRC_SOURCE_CODE" >> ~/.bashrc
  echo ".bash_prompt source line added to .bashrc."
else
  echo ".bash_prompt is already sourced in .bashrc."
fi

# Reload .bashrc to apply changes immediately
source ~/.bashrc
echo "Bash prompt has been updated. Please open a new terminal to see the changes."
