# synchrophasor-proto

The protocol specifications for all synchrophasor data projects.

## Related Projects

 * `synchrophasor-publisher` (https://github.com/michaeldye/synchrophasor-publisher): A client that connects to the `pmu-emu`s gRPC server, processes data it gathers, and then publishes it to a gRPC ingest Data Processing Engine (DPE), an instances of `synchrophasor-dpe`
 * `synchrophasor-dpe` (https://github.com/michaeldye/synchrophasor-dpe): A DPE data ingest server that is connected-to by `synchrophasor-publisher` clients
 * `pmu-emu` (https://github.com/michaeldye/pmu-emu): A Power Management Unit (PMU) Emulator

### Preconditions

 * Install `make`
 * Install Golang v.1.7.x or newer, set up an appropriate `$GOPATH`, etc. (cf. https://golang.org/doc/install)
 * Install `protoc`, the Google protobuf compiler: https://github.com/google/protobuf/releases/tag/v3.0.0 (note the download links are at the bottom of the page). If you are using an armhf system, you can use a distributable tarball we've build: `https://tor01.objectstorage.softlayer.net/v1/AUTH_bd05f276-e42f-4fa1-b7b3-780e8544769f/protobuff-dist/protobuff-3.0.0-armv7l.tar.bz2?temp_url_sig=ef1c61f39e3cf12afc64db8a94044f1ea76d7679&temp_url_expires=31492550850`.

## Building

### Considerations

This project requires that you build it from the proper place in your `$GOPATH`. Also note that it will automatically install `govendor` and the protobuf Golang bindings in your `$GOPATH` during execution.

### Steps

    make
