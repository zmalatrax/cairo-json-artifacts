# cairo-json-artifacts

This repository is used as a display for the standard proposal of Cairo programs serialized compilation artifacts.

It uses the `cairo-compile` and newly created `sierra-compile-json` binaries to produce them.

See this [PR](https://github.com/starkware-libs/cairo/pull/5912).

The `cairo` submodule is a pinned version of the tweaked compiler

The `src` folder contains the Cairo programs `*.cairo`, the Sierra file `*.sierra` produced by `cairo-compile` (textual format, used as input by `sierra-compile` and now `sierra-compile-json`), and the CASM compilation artifacts `*.json`, similar to the `*.CompiledContractClass.json` produced by `starknet-sierra-compile`.

## Makefile - Usage

| Makefile target command      | Description                                                 |
| ---------------------------- | ----------------------------------------------------------- |
| `make build`                 | Compiles `cairo-compile` and `sierra-compile-json` binaries |
| `make compile`               | Compiles all Cairo programs in `src/`                       |
| `make build-cairo-compiler`  | Compiles `cairo-compile` binary                             |
| `make build-sierra-compiler` | Compiles `sierra-compile-json` binary                       |
