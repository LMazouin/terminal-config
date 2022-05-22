# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:/usr/local/opt/ruby/bin:/usr/local/zsh/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/local/Cellar/subversion/1.13.0/bin:/usr/local/opt/gnu-getopt/bin:/usr/local/opt/openjdk/bin:/Library/TeX/texbin:/Library/Apple/usr/bin:/usr/local/opt/php@8.0/bin:$HOME/.symfony/bin:$HOME/Library/Python/3.9/bin:

# Path to your oh-my-zsh installation.
export ZSH="/Users/lmazouin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# powerline-daemon -q
# source $HOME/Library/Python/3.9/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# default theme
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ask before overriding existing file
alias cp="cp -i"

# ask before deleting file
alias rm="rm -i"

# ls environment variables
#export BLOCKSIZE=512
#export CLICOLOR_FORCE=1
#export LSCOLORS="exfxcxdxbxegedabagacad"

# default prompt
#export PS1="%n@%m %1~ %# "

# new prompt
#export PS1="%B%F{011}%K{001}%n %f%k%b%F{014}%K{012}%~%f%k %# "

#colors
#B_RBG_BYFG="\033[1;41;93m"
#N_BBG_BFG="\033[0;0;0m"
#N_WBG_BFG="\033[0;47;30m"

# a more human-friendly ls command
#alias ll="ls -Thlo | sort -fd -k 1.1,1.1r -k 9 | awk '(NR>1)' |
#awk 'BEGIN { format = \"$B_RBG_BYFG%-30s %10s %30s%10s$N_BBG_BFG\n\";
#for (i=1; i<=82; i++) printf \"$B_RBG_BYFG%s$N_BBG_BFG\", \"-\"; printf \"\n\";
#printf format, \"NOM\",  \"TAILLE\", \"DERNIERE MODIFICATION\", \" \";
#for (i=1; i<=82; i++) printf \"$B_RBG_BYFG%s$N_BBG_BFG\",\"-\"; printf \"\n\"}
#{printf \"$N_WBG_BFG%-30s %10s %21s %-3s %-14s$N_BBG_BFG\n\", \$9, \$4, \$5, \$6, \$8}' "

export JAVA_HOME="/usr/libexec/java_home"

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT"  ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
