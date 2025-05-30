#!/bin/bash

# For initial and with stricter convergence 
ecut=40.0
nk=4
for conv_thr in "1.0d-8" "1.0d-12"; do
    bash create_Si.scf.in_template.sh $ecut $nk $conv_thr
done

# for various ecut other than 40.0
conv_thr="1.0d-8"
for ecut in 20.0 30.0 50.0; do
    bash create_Si.scf.in_template.sh $ecut $nk $conv_thr
done

# for various k-points other than 4 
ecut=40.0
for nk in 2 6; do
    bash create_Si.scf.in_template.sh $ecut $nk $conv_thr
done