#!/bin/bash

# For initial and with stricter convergence 
ecut=40.0
nk=4
conv_thr="1.0d-8"
for ntasks in 2 12 64; do
    bash create_Si.scf.in_template.sh $ecut $nk $conv_thr $ntasks
done
