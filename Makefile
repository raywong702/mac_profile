all:bash git python vim

bash:
	cp .bash_profile ~/.bash_profile

git:
	cp .gitignore ~/.gitignore
	cp git-completion.bash ~/git-completion.bash
	cp git-prompt.sh ~/git-prompt.sh

python:
	cp python-startup.py ~/python-startup.py

vim:
	cp .vimrc ~/.vimrc
	cp -r .vim ~/.vim
