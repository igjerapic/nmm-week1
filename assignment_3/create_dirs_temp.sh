#!/bin/bash

# Create 4 directories for 4 simulations with 2 chain lengths and 2 lj_cutoff values
eta=0.45
for temperature in 1.0 0.9 0.8 0.7; do
    dir_name="temp${temperature}_eta${eta}"
    echo "Creating directory: $dir_name"
    mkdir -p "$dir_name"
done

