export
XDG_CONFIG_HOME	:= $(HOME)/.config
XDG_DATA_HOME	:= $(HOME)/.local/share
XDG_STATE_HOME	:= $(HOME)/.local/state

.PHONY: all
all: init link homebrew

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
