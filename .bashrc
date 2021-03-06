# Background Colours
#40 Black
#41 Red
#42 Green
#43 Yellow
#44 Blue
#45 Magenta
#46 Cyan
#47 White

# Foregorunf Colours
#30 Black
#31 Red
#32 Green
#33 Yellow
#34 Blue
#35 Magenta
#36 Cyan
#37 White

#0 Reser all attributes
#1 Bright
#2 Dim
#4 Underscore
#5 Blink
#7 Reverse
#8 Hidden

#\e[ – Indicates the beginning of color prompt
#x;ym – Indicates color code. x 0-8 (see above). y use color code above
#\e[m – indicates the end of color prompt


export PS1="\[\e[1;36m\][\t] \[\e[m\]\u:\h \W \[\e[1;37m\]$ \[\e[m\]"
alias ginfo="git config --local --list && git log -n 1"

# adding gradle
#GRADLE_HOME="$HOME/repo/gradle"
#export PATH="$GRADLE_HOME/bin:$PATH"

#if [ -d "/Volumes/PRADA/homebrew-master/Cellar" ]; then
#	export HOMEBREW_TEMP="/Volumes/PRADA/homebrew-master/Cellar"
#fi

#ctags installed via homebrew resides in /usr/local/bin
#also Ensure user-installed binaries take precedence
export PATH="/usr/local/bin:$PATH"
#export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

# mac has BSD version of ls, wont recognize --color
alias ls='ls -G'
#alias ls='ls -h --color'

alias grep='grep --color=auto'
