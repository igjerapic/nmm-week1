#!/bin/bash

# Create 4 directories for 4 simulations with 2 chain lengths and 2 lj_cutoff values
temperature=1.0
for eta in 0.7 0.6 0.5 0.4; do
    dir_name="temp${temperature}_eta${eta}"
    echo "Creating directory: $dir_name"
    mkdir -p "$dir_name"
done

