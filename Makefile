.PHONY: build-cairo-compiler build-sierra-compiler build-cairo


CAIRO_COMPILER=cairo/target/release/cairo-compile
SIERRA_COMPILER=cairo/target/release/sierra-compile-json

$(CAIRO_COMPILER):
	@git submodule update --init cairo; \
	cd cairo; cargo build --release --bin cairo-compile

$(SIERRA_COMPILER):
	@git submodule update --init cairo; \
	cd cairo; cargo build --release --bin sierra-compile-json

build-cairo-compiler: | $(CAIRO_COMPILER)
build-sierra-compiler: | $(SIERRA_COMPILER)
build-cairo: build-cairo-compiler build-sierra-compiler

CAIRO_PATH=src/
CAIRO_FILES:=$(shell find $(CAIRO_PATH) -name '*.cairo')
SIERRA_FILES:=$(CAIRO_FILES:%.cairo=%.sierra)
COMPILED_CAIRO_FILES:=$(SIERRA_FILES:%.sierra=%.json)

$(COMPILED_CAIRO_FILES): %.json: %.sierra
	$(SIERRA_COMPILER) $< $@

%.sierra: %.cairo
	$(CAIRO_COMPILER) -r -s $< $@

compile: $(COMPILED_CAIRO_FILES)
