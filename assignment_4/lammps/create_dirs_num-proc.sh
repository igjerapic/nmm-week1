#!/bin/bash

temperature=1.0
eta=0.5
num_part=4096 # number of particles
lj_cut=1.12

# Create 4 directories different LJ potential cutoffs.
for coul_cut in 0.0 6.0; do
    for ntasks in 2 4 8 16 32; do
        N=$(( num_part * 2 ))
        dir_name="temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${N}_M${ntasks}"
        echo "Creating directory: $dir_name"
        mkdir -p "$dir_name"
    done
done
