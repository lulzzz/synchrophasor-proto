SHELL := /bin/bash
VERSION = $(shell cat VERSION)

all: build

build: $(find . -not -iname "*.proto" -print0) $(GOPATH)/bin/protoc
	cd $(GOPATH)/src && \
		find ./github.com/michaeldye/synchrophasor-proto -iname "*.proto" -print0 | xargs -0 -I {} protoc --go_out=plugins=grpc:. {}

clean:
	find . -iname "*.pb.go" -print0 | xargs -0 rm -f

# bail if there are uncommitted changes (note: this doesn't know about or check untracked, uncommitted files)
dirty:
	@echo "Checking if your local repository or index have uncommitted changes..."
	git diff-index --quiet HEAD

publish: dirty clean
	git tag $(VERSION) -f
	git push -f --tags canonical master

$(GOPATH)/bin/protoc:
	go get -u github.com/golang/protobuf/protoc-gen-go

.PHONY: clean dirty publish protoc
