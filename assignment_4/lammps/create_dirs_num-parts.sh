#!/bin/bash

temperature=1.0
eta=0.5
num_part=4096 # number of particles
ntasks=1    # number of processors used in mpirun -np M before 
lj_cut=1.12

# Create 4 directories different LJ potential cutoffs.
for coul_cut in 0.0 6.0; do
    for mult in 2 4 8 16; do
        N=$(( mult *  num_part ))
        dir_name="temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${N}_M${ntasks}"
        echo "Creating directory: $dir_name"
        mkdir -p "$dir_name"
    done
done

