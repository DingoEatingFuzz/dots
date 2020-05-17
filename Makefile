.DEFAULT_GOAL := setup

setup:
	mkdir -p ~/.vim/backups
	mkdir -p ~/.vim/swaps
	mkdir -p ~/.vim/undo
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "Makefile" --exclude "README.md" -av . ~
	source ~/.bash_profile
	echo "Welcome back!"

macos:
	./.macos

setup-vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "vim-plug installed: open VIM and run the :PlugInstall command"

wsl:
	./.wsl
