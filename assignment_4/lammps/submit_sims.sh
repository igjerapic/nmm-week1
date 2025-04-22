#!/bin/bash

eta=0.5
temperature=1.0
num_part=4096 # number of particles

# for cut-off ranges
# LJ cutoff
ntasks=1
coul_cut=0.0
for lj_cut in 1.12 2.0 4.0 6.0; do
    dir_name="temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${num_part}_M${ntasks}"
    # echo "submitting simulation in $dir_name"
    cd "$dir_name"
    # (cd "$dir_name" && sbatch submit.sh)
done

# Coulomb cutoff
ntasks=1     
lj_cut=1.12
for coul_cut in 1.12 2.0 4.0 6.0; do
    dir_name="temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${num_part}_M${ntasks}" 
    # echo "submitting simulation in $dir_name"
    cd "$dir_name"
    # (cd "$dir_name" && sbatch submit.sh)
done

# for range of particle numbers
ntasks=1  
for coul_cut in 0.0 6.0; do
    for mult in 2 4 8 16; do
        N=$(( mult *  num_part ))
        dir_name="temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${N}_M${ntasks}"
        # echo "submitting simulation in $dir_name"
        cd "$dir_name"
        # (cd "$dir_name" && sbatch submit.sh)
    done
done

# dfferent num of processers used
lj_cut=1.12
for coul_cut in 0.0 6.0; do
    for ntasks in 2 4 8 16 32; do
        N=$(( num_part * 2 ))
        dir_name="temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${N}_M${ntasks}"
        # echo "submitting simulation in $dir_name"
        cd "$dir_name"
       # (cd "$dir_name" && sbatch submit.sh)
    done
done


