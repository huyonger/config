update:
	git submodule foreach git pull

install: install-externals install-core

install-core:
	@echo "Core install tasks."
	@echo "Backing up your .zshrc iff neccessary..."
	@!(ls $(HOME)/.zshrc > /dev/null 2> /dev/null) || mv $(HOME)/.zshrc $(PWD)/zshrc.bak # Make backup of -zshrc if necessary
	@echo "Install oh-my-zsh..."
	@ln -s $(PWD)/zshrc $(HOME)/.zshrc # update the link to .zshrc
	@ln -s $(PWD)/ohmyzsh $(HOME)/.oh-my-zsh
	@ln -s $(PWD)/zsh-syntax-highlighting $(PWD)/ohmyzsh/custom/plugins/zsh-syntax-highlighting 
	@ln -s $(PWD)/zsh-autosuggestions $(PWD)/ohmyzsh/custom/plugins/zsh-autosuggestions 
	@ln -s $(PWD)/autojump $(PWD)/ohmyzsh/custom/plugins/autojump 
	@cd autojump && ./install.py && cd ..
	@echo "Backing up your .vimrc iff neccessary..."
	@!(ls $(HOME)/.vimrc > /dev/null 2> /dev/null) || mv $(HOME)/.vimrc $(PWD)/vimrc.bak # Make backup of -vimrc if necessary
	@ln -s $(PWD)/vimrc $(HOME)/.vimrc # update the link to .zshrc
	@echo "Install vim-plug..."
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo "DONE with core install tasks."
	@echo "use vim-plug manager PlugInstall command to install plugins"

install-externals:
	git submodule update --init
