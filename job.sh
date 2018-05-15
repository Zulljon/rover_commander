#!/bin/bash

# This script need to be exec after changes or some fixes before commit to git
# func:
# - zip gerbers
# - plot .png .pdf (use EESHOW utility)

PROJname="rover_commander"
FILEname="rover_commander"

eeplot -o pdf:${PROJname}.pdf ${FILEname}.pro
eeplot -o png:${PROJname}.png -s 4 ${FILEname}.pro

if [[ -e "${PROJname}-F.Cu.gbr" ]]; then
	zip -9 ${PROJname}.zip *.gbr *.drl readme.txt readme_RU.txt
	rm *.gbr *.drl
fi
