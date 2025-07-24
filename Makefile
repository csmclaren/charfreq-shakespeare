.PHONY: all clean input output

all: clean input output set-permissions set-timestamps

include tools/charfreq-tools/common.mk

INPUT := input/100.txt
ORDERS := 1 2 3
OUTPUT_NGRAMS_NC := $(foreach N,$(ORDERS),output/$(N)-grams.tsv)
OUTPUT_NGRAMS_UC := $(foreach N,$(ORDERS),output/$(N)-grams-uc.tsv)
OUTPUT_NGRAMS := $(OUTPUT_NGRAMS_NC) $(OUTPUT_NGRAMS_UC)
OUTPUT_NGRAMS_WITH_C_AND_P := $(OUTPUT_NGRAMS:%.tsv=%-with-c-and-p.tsv)
OUTPUT := $(OUTPUT_NGRAMS) $(OUTPUT_NGRAMS_WITH_C_AND_P)

clean: clean-output clean-venv

input: $(INPUT)

$(INPUT): | input-dir
	curl -L -o $@ https://www.gutenberg.org/ebooks/100.txt.utf-8

output: $(OUTPUT)

$(OUTPUT_NGRAMS): $(INPUT) | output-dir
	uv run tools/charfreq-tools/ngrams.py \
		$(INPUT) \
		output/

output/%-with-c-and-p.tsv: output/%.tsv
	tools/charfreq-tools/append-c-and-p 2 < $< > $@
