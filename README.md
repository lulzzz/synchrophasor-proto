# synchrophasor-proto

The protocol specifications for all synchrophasor data projects.

## Related Projects

 * `synchrophasor-publisher` (https://github.com/michaeldye/synchrophasor-publisher): A client that connects to the `pmu-emu`s gRPC server, processes data it gathers, and then publishes it to a gRPC ingest Data Processing Engine (DPE), an instances of `synchrophasor-dpe`
 * `synchrophasor-dpe` (https://github.com/michaeldye/synchrophasor-dpe): A DPE data ingest server that is connected-to by `synchrophasor-publisher` clients
 * `pmu-emu` (https://github.com/michaeldye/pmu-emu): A Power Management Unit (PMU) Emulator

### Preconditions

 * Install `make`
 * Install Golang v.1.7.x or newer, set up an appropriate `$GOPATH`, etc. (cf. https://golang.org/doc/install)

## Building

### Considerations

This project requires that you build it from the proper place in your `$GOPATH`. Also note that it will automatically install `govendor` and `protoc` in your `$GOPATH` during execution.

### Steps

    make
