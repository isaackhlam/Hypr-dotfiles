all: init

init:
	git submodule init
	git submodule update
	git submodule foreach git pull origin main
