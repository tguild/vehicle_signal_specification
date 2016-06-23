#
# Makefile to generate specifications
#

.PHONY: all

all: json franca

json: vst
	./tools/vspec2json.py -i:spec/VehicleSignalSpecification.id:0 -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).json

franca: vst
	./tools/vspec2franca.py -v $$(cat VERSION) -i:spec/VehicleSignalSpecification.id:0 -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).fidl
