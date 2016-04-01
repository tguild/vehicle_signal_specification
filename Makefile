#
# Makefile to generate specifications
#
VST_GIT=

.PHONY: all

all: json

vst:
	git clone https://github.com/PDXostc/vehicle_signal_tools.git vst

json: vst
	./tools/vspec2json.py -I ./spec ./spec/root.vspec > vss_rel_$$(cat VERSION).json

