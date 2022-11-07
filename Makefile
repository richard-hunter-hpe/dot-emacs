# Set config folder path
SRC_DIR := $(shell pwd)

# Source file
SRC_FILE := $(SRC_DIR)/emacs.org

# Destination file
DEST_FILE := $(SRC_DIR)/emacs.el

# Destination directory
DEST_DIR := $(SRC_DIR)/lisp

# EMACS_BINARY should point to your installation of GNU emacs
EMACS_BINARY := /Users/hunterri/git/emacs/src/emacs

# The following will compile emacs.org to emacs.el
EMACS = $(shell $(EMACS_BINARY) -nw --batch --eval "(require 'org)" --eval "(org-babel-load-file \"emacs.org\")")

.PHONY: test build clean help install

## help: Output this message and exit
help:
	@fgrep -h '##' $(MAKEFILE_LIST) | fgrep -v fgrep | column -t -s ':' | sed -e 's/## //'

## all: Main Rule
all: build

setup-dest-dir:
	mkdir -p $(DEST_DIR)

## build: Generate and compile lisp
build: setup-dest-dir |
	$(EMACS) 

## test: Test init file
test: build;
	$(shell $(EMACS_BINARY) -nw -Q -l $(DEST_FILE))

## print-test: Test init file
print-test:
	echo $(EMACS_BINARY) -nw -Q -l $(DEST_FILE)


## test-gui: Test gui version (if installed)
test-gui:
	$(shell $(EMACS_BINARY) -Q -l $(DEST_FILE))

## clean: Clean up
clean:
	rm -rf $(DEST_DIR) $(DEST_FILE)


## install: Move files to .emacs.d
install:
	cp $(SRC_FILE) $(HOME)/.emacs.d
	cp $(SRC_DIR)/Makefile $(HOME)/.emacs.d
	cd $(HOME)/.emacs.d && make build
	mv $(HOME)/.emacs.d/emacs.el $(HOME)/.emacs.d/init.el
