EMCC_OPTS=-Wno-expansion-to-defined -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -s EXPORTED_FUNCTIONS="['_malloc']" -s EXPORTED_RUNTIME_METHODS="['setValue', 'getValue','allocate']"

LIBOPUS_STABLE=tags/v1.1.2

OPUS_DIR=./opus
OPUS_OBJ=$(OPUS_DIR)/.libs/libopus.a

SPEEXDSP_DIR=./speexdsp
SPEEXDSP_OBJ=$(SPEEXDSP_DIR)/libspeexdsp/.libs/libspeexdsp.a

DIST=./dist


OPUSJS=$(DIST)/libopus.js
OPUSJS_EXPORTS:='_opus_encoder_create','_opus_encode_float','_opus_encoder_ctl','_opus_encoder_destroy','_malloc','_free','_opus_decoder_create','_opus_decode_float','_opus_decoder_ctl','_opus_decoder_destroy'
SPEEXDSP_EXPORTS:='_speex_resampler_init','_speex_resampler_destroy','_speex_resampler_process_interleaved_float'


TARGETS=$(OPUS_OBJ) $(SPEEXDSP_OBJ) $(OPUSJS)

all: $(TARGETS)
clean:
	rm -rf $(OPUS_OBJ) $(SPEEXDSP_OBJ) $(DIST)
	mkdir $(DIST)

submodule:
	cd $(OPUS_DIR); git checkout ${LIBOPUS_STABLE}

$(OPUSJS): $(OPUS_OBJ) $(SPEEXDSP_OBJ)
	emcc -o $@ $(EMCC_OPTS) -Wno-expansion-to-defined -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -s EXPORTED_FUNCTIONS="[$(OPUSJS_EXPORTS),$(SPEEXDSP_EXPORTS)]" $(OPUS_OBJ) $(SPEEXDSP_OBJ)

$(OPUS_OBJ): submodule $(OPUS_DIR)/Makefile
	cd $(OPUS_DIR); emmake make
$(OPUS_DIR)/Makefile: $(OPUS_DIR)/configure
	cd $(OPUS_DIR); emconfigure ./configure --disable-extra-programs --disable-doc
$(OPUS_DIR)/configure:
	cd $(OPUS_DIR); ./autogen.sh
$(SPEEXDSP_OBJ): $(SPEEXDSP_DIR)/Makefile
	cd $(SPEEXDSP_DIR); emmake make
$(SPEEXDSP_DIR)/Makefile: $(SPEEXDSP_DIR)/configure
	cd $(SPEEXDSP_DIR); emconfigure ./configure --disable-examples
$(SPEEXDSP_DIR)/configure:
	cd $(SPEEXDSP_DIR); ./autogen.sh
