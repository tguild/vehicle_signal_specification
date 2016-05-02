#
# Makefile to generate specifications
#
VST_GIT=

.PHONY: all

all: json

json: vst
	./tools/vspec2json.py -I ./spec ./spec/VehicleSignalSpecification.vspec > vss_rel_$$(cat VERSION).json

