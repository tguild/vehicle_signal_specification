#
# Makefile to generate specifications
#
VST_GIT=

.PHONY: all

all: json

json: vst
	./tools/vspec2json.py -i:spec/VehicleSignalSpecification.id:0 -I ./spec ./spec/VehicleSignalSpecification.vspec > vss_rel_$$(cat VERSION).json
