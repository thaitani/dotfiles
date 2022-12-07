export
XDG_CONFIG_HOME	:= $(HOME)/.config
XDG_DATA_HOME	:= $(HOME)/.local/share
XDG_STATE_HOME	:= $(HOME)/.local/state

.PHONY: all
all: init link homebrew mac

.PHONY: init
init:
	./setup_scripts/init.bash

.PHONY: link
link:
	./setup_scripts/links.bash

.PHONY: mac
mac:
	./setup_scripts/mac.bash

.PHONY: homebrew
homebrew:
	./setup_scripts/homebrew.bash

# install after
.PHONY: asdf
asdf:
	asdf plugin add python
	asdf plugin add nodejs
	asdf plugin add terraform
	asdf plugin add deno https://github.com/asdf-community/asdf-deno.git

	asdf install

.PHONY: cz
cz:
	npm install --global commitizen cz-conventional-changelog cz-conventional-changelog-ja
