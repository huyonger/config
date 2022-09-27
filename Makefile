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
	@ln -s $(PWD)/ohmyzsh/custom/plugins/zsh-syntax-highlighting $(HOME)/zsh-syntax-highlighting
	@ln -s $(PWD)/ohmyzsh/custom/plugins/zsh-autosuggestions $(HOME)/zsh-autosuggestions
	@ln -s $(PWD)/ohmyzsh/custom/plugins/autojump $(HOME)/autojump
	@python $(PWD)/ohmyzsh/custom/plugins/autojump/install.py
	@echo "Backing up your .vimrc iff neccessary..."
	@!(ls $(HOME)/.vimrc > /dev/null 2> /dev/null) || mv $(HOME)/.vimrc $(PWD)/vimrc.bak # Make backup of -vimrc if necessary
	@echo "DONE with core install tasks."

install-externals:
	git submodule update --init