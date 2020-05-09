.DEFAULT_GOAL := setup

setup:
	mkdir -p ~/.vim/backups
	mkdir -p ~/.vim/swaps
	mkdir -p ~/.vim/undo
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "Makefile" --exclude "README.md" -av . ~
	source ~/.bash_profile
	echo "Welcome back!"
