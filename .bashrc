
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="/home/djukic/hacking/:$PATH"

alias vps="ssh -i /home/djukic/.ssh/djukic plethora@20.113.65.94"
alias ftpvps="sftp -i /home/djukic/.ssh/djukic plethora@20.113.65.94"
alias ll="ls -l"

alias ls='ls --color=auto'
export PS1='\[\e[1;37m\][\u@\[\e[1;37m\]\H] \[\e[1;32m\]\w \[\e[1;36m\]\$ \[\e[0m\]' 
export vblank_mode=0
neofetch
alias config='/usr/bin/git --git-dir=/home/djukic/.cfg/ --work-tree=/home/djukic'
