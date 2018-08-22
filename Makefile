# Load .env files preserving existing variables
# Order of precedence
# » * Environment variables
# » * ${HOME}/.env
# » * ${PROJECT}/.env
DOTENV = $(shell tmpfile=$$(mktemp); (cat $$HOME/.env 2>/dev/null; cat .env 2>/dev/null) | grep -v --perl-regexp '^('$$(env | sed 's/=.*//'g | tr '\n' '|')')\=' > $$tmpfile 2>/dev/null; echo $$tmpfile)
include $(DOTENV)
export $(shell [ ! -n "$(DOTENV)" ] || cat $(DOTENV) | sed 's/=.*//'g)

setup:
	@mkdir -p build

install-go:
	@dpkg -l | grep --silent golang-go && sudo apt-get install --yes golang-go

install-java:
	@dpkg -l | grep --silent openjdk-9-jdk && sudo apt-get install --yes openjdk-9-jdk

install-c:
	@dpkg -l | grep --silent gcc && sudo apt-get install --yes gcc

build/lookup: dnslookup/lookup.c install-c setup
	@gcc -o build/lookup dnslookup/lookup.c

build/lookupgo: dnslookup/lookupgo.go install-go setup
	go build build/lookupgo dnslookup/lookupgo.go

test-ns-glibc-go: build/lookup
	@chmod +x build/lookup
	sudo sh dnslookup/getaddressProbe.sh &
	build/lookup google.com
