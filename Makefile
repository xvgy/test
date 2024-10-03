MAKEDIR	:= $(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

all: once
once: pre omb nvim stow

pre:
	@[ -f $${HOME}/.gitconfig ] && mv $${HOME}/.gitconfig $${HOME}/.gitprofile || echo "make: No .gitconfig found"

nvim: SHELL:=/usr/bin/env bash
nvim:
	@mkdir -p ~/.config/nvim/colors
	@mkdir -p ~/.config/nvim/autoload
	@mkdir -p ~/.cache/nvim/{backup,swap,undo}
	@mkdir -p ~/.cache/nvim/plugged
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs	\
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

stow: SHELL:=/usr/bin/env bash
stow:
	stow --verbose=1 --target=$${HOME} home
	stow --verbose=1 --dir=$(MAKEDIR) --target=/tmp live

unstow: SHELL:=/usr/bin/env bash
unstow:
	stow -D --verbose=1 --target=$${HOME} home
	stow -D --verbose=1 --dir=$(MAKEDIR) --target=/tmp live

omb: SHELL:=/usr/bin/env bash
omb:
	curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh \
		| bash -
	@rm -f $${HOME}/.bashrc
