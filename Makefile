SHELL := /bin/bash
VERSION = $(shell cat VERSION)

all: build

build: $(find . -not -iname "*.proto" -print0) $(GOPATH)/bin/protoc-gen-go
	# N.B. this is really lame: the "M"<path_to_proto>=<go_pkg_path> is the way to get golang packages generated from proto files to have the full golang import paths; each file that is imported needs to have a mapping like this in our compile string. See https://github.com/golang/protobuf/issues/63.
	find . -iname "*.proto" -print0 | xargs -0 -I {} protoc --proto_path=. --python_out=. --go_out=plugins=grpc,Mpmu_server/synchrophasor_data.proto=github.com/michaeldye/synchrophasor-proto/pmu_server:. {}

clean:
	find . \( -iname "*.pb.go" -or -iname "*_pb2.py" \) -print0 | xargs -0 rm -f

# bail if there are uncommitted changes (note: this doesn't know about or check untracked, uncommitted files)
dirty:
	@echo "Checking if your local repository or index have uncommitted changes..."
	git diff-index --quiet HEAD

publish: dirty clean
	git tag $(VERSION) -f
	git push -f --tags canonical master

$(GOPATH)/bin/protoc-gen-go:
	go get -u github.com/golang/protobuf/protoc-gen-go

.PHONY: clean dirty publish
