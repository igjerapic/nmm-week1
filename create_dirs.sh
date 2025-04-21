#!/bin/bash

# Create 4 directories for 4 simulations with 2 chain lengths and 2 lj_cutoff values

for temperature in 1.0 0.9 0.8; do
    dir_name="temp_${temperature}"
    echo "Creating directory: $dir_name"
    mkdir -p "$dir_name"
done

