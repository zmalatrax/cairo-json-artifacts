# cairo-json-artifacts

This repository is used as a display for the standard proposal of Cairo programs serialized compilation artifacts.

It uses the `cairo-compile` and newly created `sierra-compile-json` binaries to produce them.

See this [PR](https://github.com/starkware-libs/cairo/pull/5912).

The `cairo` submodule is a pinned version of the tweaked compiler

The `src` folder contains the Cairo programs `*.cairo`, the Sierra file `*.sierra` produced by `cairo-compile` (textual format, used as input by `sierra-compile` and now `sierra-compile-json`), and the CASM compilation artifacts `*.json`, similar to the `*.CompiledContractClass.json` produced by `starknet-sierra-compile`.

## Makefile - Usage

To build the compiler use `make build`.
To compile all Cairo files in `src/`, use `make compile`

To only build the `cairo-compile` bin, use `make build-cairo-compiler`.
To only build the `sierra-compile-json` bin, use `make build-sierra-compiler`.
