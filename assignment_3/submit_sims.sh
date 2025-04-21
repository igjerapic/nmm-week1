#!/bin/bash

# submit each of the simulations for fixed packing fraction
eta=0.45
for temperature in 1.0 0.9 0.8 0.7; do
    dir_name="temp${temperature}_eta${eta}"
    echo "submitting simulation in $dir_name"

    (cd "$dir_name" && sbatch submit.sh)
done
temperature=1.0
for eta in 0.7 0.6 0.5 0.4; do
    dir_name="temp${temperature}_eta${eta}"
    echo "submitting simulation in $dir_name"

    (cd "$dir_name" && sbatch submit.sh)
done


