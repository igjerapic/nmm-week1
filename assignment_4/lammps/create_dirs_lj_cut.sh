#!/bin/bash

temperature=1.0
eta=0.5
num_part=4096 # number of particles
ntasks=1      # number of processors used in mpirun -np M before 
coul_cut=0.0

# Create 4 directories different LJ potential cutoffs.
for lj_cut in 1.12 1.5 2.0 2.5; do
    dir_name="temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${num_part}_M${ntasks}"
    echo "Creating directory: $dir_name"
    mkdir -p "$dir_name"
done