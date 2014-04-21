# Background Colours
#40 Black
#41 Red
#42 Green
#43 Yellow
#44 Blue
#45 Magenta
#46 Cyan
#47 White

#0 Reser all attributes
#1 Bright
#2 Dim
#4 Underscore
#5 Blink
#7 Reverse
#8 Hidden

# Foregorunf Colours
#30 Black
#31 Red
#32 Green
#33 Yellow
#34 Blue
#35 Magenta
#36 Cyan
#37 White

export PS1="\[\e[1;36m\][\t] \[\e[m\]\u \W \[\e[1;37m\]$ \[\e[m\]"
alias ginfo="git config --local --list && git log -n 1"
