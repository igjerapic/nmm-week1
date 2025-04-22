#!/bin/bash

# For initial and with stricter convergence 
ecut=40.0
nk=4
conv_thr="1.0d-8"
for ntasks in 2 12 64; do
    dir_name="Si.scf_ecutwfc${ecut}_nk${nk}_conv-thr${conv_thr}_ntasks${ntasks}"
    echo "submitting simulation in $dir_name"

    (cd $dir_name && sbatch quantum.qsub)
done
