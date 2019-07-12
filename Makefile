#
# Makefile to generate specifications
#

.PHONY: clean all json franca c

all: clean json franca csv c

json:
	./tools/vspec2json.py -i:spec/VehicleSignalSpecification.id -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).json

franca:
	./tools/vspec2franca.py -v $$(cat VERSION) -i:spec/VehicleSignalSpecification.id -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).fidl


csv:
	./tools/vspec2csv.py -i:spec/VehicleSignalSpecification.id -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).csv


cnative:
	./tools/vspec2cnative.py -i:./spec/VehicleSignalSpecification.id ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).cnative


c:
	./tools/vspec2c.py -i:spec/VehicleSignalSpecification.id -I ./spec ./spec/VehicleSignalSpecification.vspec vss_rel_$$(cat VERSION).h vss_rel_$$(cat VERSION)_macro.h
	(cd ./tools/vspec2c/; make )

clean:
	rm -f vss_rel_$$(cat VERSION).json vss_rel_$$(cat VERSION).fidl vss_rel_$$(cat VERSION).csv vss_rel_$$(cat VERSION).h
	(cd ./tools/vspec2c/; make clean)
