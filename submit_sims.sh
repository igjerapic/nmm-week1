#!/bin/bash

# submit each of the simulations

for temperature in 1.0 0.9 0.8; do
    dir_name="temp_${temperature}"
    echo "submitting simulation in $dir_name"

    (cd "$dir_name" && sbatch submit.sh)
done


