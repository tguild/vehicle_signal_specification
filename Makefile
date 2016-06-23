#
# Makefile to generate specifications
#

.PHONY: all json franca vsi

all: json franca vsi

json: 
	./tools/vspec2json.py -i:spec/VehicleSignalSpecification.id:0 -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).json

franca:
	./tools/vspec2franca.py -v $$(cat VERSION) -i:spec/VehicleSignalSpecification.id:0 -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).fidl

vsi:
	./tools/vspec2vsi.py -v $$(cat VERSION) -i:spec/VehicleSignalSpecification.id:0 -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).vsi
