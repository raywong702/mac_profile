# Enable Git tab completion
source ~/git-completion.bash

# Virtualenv Wrapper
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

# Change Git command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory

# Enable Brew tab completion
###source `brew --repository`/Library/Contributions/brew_bash_completion.sh

# Only need for coreutils. Everything else is in /usr/local/bin
# But use gfind, ggrep, etc. Starts with a 'g'
BREW_PATHS=$(brew --prefix coreutils)/libexec/gnubin
PATH=$BREW_PATHS:/usr/local/bin:/usr/local/sbin:$PATH
PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH
export PATH

# Python path for projects
PYTHONPATH=$PYTHONPATH:/Users/raymond/Projects/LearnPythonGroup/PyCards
PYTHONPATH=$PYTHONPATH:/Users/raymond/Projects/LearnPythonGroup/jeeves
export PYTHONPATH

# Python interpreter startup script
export PYTHONSTARTUP=$HOME/python-startup.py

# Colors
turquoise="\[\033[36m\]"
green="\[\033[m\]"
forest_green="\[\033[32m\]"
amber="\[\033[33;1m\]"
lime_green="\[\033[m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]" #green2

export PS1="$turquoise\u$green@$forest_green\h:$amber\w$purple\$(__git_ps1)$lime_green\$ "
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad
#export LSCOLORS=GxFxCxDxBxegedabagaced

#alias ls='ls -GFh --color'
#alias ls='ls -GFh'

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `dircolors ~/.dir_colors`
fi

alias ls='ls $LS_OPTIONS -GFh'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias showDownloads='sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* '"'"'select LSQuarantineTimeStamp, LSQuarantineDataURLString from LSQuarantineEvent'"'"' | php -r '"'"'date_default_timezone_set("America/Montreal"); foreach (explode("\n", file_get_contents("php://stdin")) as $l) { preg_match("/([0-9\\.]+)\\|(.*)\$/", $l, $re); echo date("Y-m-d H:i:s",strtotime("2000-01-01 19:00")+$re[1])."\t$re[2]\n"; }'"'"''

alias deleteDownloads='sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* '"'"'delete from LSQuarantineEvent'"'"''

alias python3='python3 -q'

alias nas='ssh -p 10003 raymond@thewongguy.ddns.net'

alias nasroot='ssh -p 10003 root@thewongguy.ddns.net'

alias aws="ssh -i ~/Projects/aws/aws.pem ec2-user@thewongguy.noip.me"
