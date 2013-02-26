#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /opt/local/share/git-core/git-prompt.sh ]; then
	source /opt/local/share/git-core/git-prompt.sh
fi

# bash completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
	. /opt/local/etc/profile.d/bash_completion.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\] '
PS1='\[\e[0;31m\]\u@\h\[\e[m\]:\[\e[1;36m\]\w\[\e[m\]\[\e[0;31m\] $(__git_ps1 "(%s)")\[\e[m\]\[\033[31m\]$ \[\033[00m\]'

#PS1='\[\033[32m\]\[\033[00m\]\[\033[34m\]\w\[\033[31m\]$(__git_ps1 "[%s]")\[\033[00m\]\$ '
if [ -f ~/.dir_colors ]; then
      eval `dircolors ~/.dir_colors`
fi

# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias ..='cd ..'
#alias pacman='pacman-color'
alias ctags='ctags -R -a'

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
#alias openports='netstat --all --numeric --programs --inet --inet6'
#alias pg='ps -Af | grep $1'         # requires an argument (note: /usr/bin/pg is installed by the util-linux package; maybe a different alias name should be used)

# privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    #alias update='sudo pacman -Su'
    #alias netcfg='sudo netcfg2'
fi

# ls
alias ls='ls -hFG'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# pacman aliases (if applicable, replace 'pacman' with 'yaourt'/'pacaur'/whatever)
#alias pac="pacman -S"      # default action     - install one or more packages
#alias pacu="pacman -Syu"   # '[u]pdate'         - upgrade all packages to their newest version
#alias pacs="pacman -Ss"    # '[s]earch'         - search for a package using one or more keywords
#alias paci="pacman -Si"    # '[i]nfo'           - show information about a package
#alias pacr="pacman -R"     # '[r]emove'         - uninstall one or more packages
#alias pacl="pacman -Sl"    # '[l]ist'           - list all packages of a repository
#alias pacll="pacman -Qqm"  # '[l]ist [l]ocal'   - list all packages which were locally installed (e.g. AUR packages)
#alias paclo="pacman -Qdt"  # '[l]ist [o]rphans' - list all packages which are orphaned
#alias paco="pacman -Qo"    # '[o]wner'          - determine which package owns a given file
#alias pacf="pacman -Ql"    # '[f]iles'          - list all files installed by a given package
#alias pacc="pacman -Sc"    # '[c]lean cache'    - delete all not currently installed package files
#alias pacm="makepkg -fci"  # '[m]ake'           - make package from PKGBUILD file in current directory


export PORTS_HOME=/opt/local
export PATH=$PORTS_HOME/bin:$PORTS_HOME/sbin:$PATH:/Users/strobo/work/arm/gcc-arm-none-eabi-4_7-2012q4/bin
export MANPATH=$PORTS_HOME/man:$MANPATH

# PATH for searching c headers
export C_INCLUDE_PATH=$PORTS_HOME/include:$C_INCLUDE_PATH

# PATH for searching c++ headers
export CPLUS_INCLUDE_PATH=$PORTS_HOME/include:$CPLUS_INCLUDE_PATH

# Library PATH for gcc when using -l option
LIBRARY_PATH=.:$PORTS_HOME/lib:$LIBRARY_PATH

# runtime library PATH
#     By default, it is set to $(HOME)/lib:/usr/local/lib:/lib:/usr/lib.
#     ref: http://apribase.net/2010/11/13/macports-dyld_library_path/
#export DYLD_FALLBACK_LIBRARY_PATH=.:$PORTS_HOME/lib:$DYLD_FALLBACK_LIBRARY_PATH

