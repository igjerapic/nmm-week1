#!/bin/bash

# A bash script used to extract the performance of the LAMMPS scripts in the assignment

eta=0.5
temperature=1.0
num_part=4096 # number of particles


# LJ cutoff
ntasks=1
coul_cut=0.0
for lj_cut in 1.12 2.0 4.0 6.0; do
    dir_name="lammps/temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${num_part}_M${ntasks}"
    echo "extracting performance from $dir_name"
    
    output_file="$dir_name/out.lammps"
    rate=$(grep Performance $output_file | tail -n 1 | awk '{print $(NF-1)}') 
    echo "$lj_cut  $rate" >> performance_lj-cut
done

# Coulomb cutoff
ntasks=1     
lj_cut=1.12
for coul_cut in 1.12 2.0 4.0 6.0; do
    dir_name="lammps/temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${num_part}_M${ntasks}"
    echo "extracting performance from $dir_name"
    
    output_file="$dir_name/out.lammps"
    rate=$(grep Performance $output_file | tail -n 1 | awk '{print $(NF-1)}') 
    echo "$coul_cut  $rate" >> performance_coul-cut
done

# for range of particle numbers
ntasks=1  
for coul_cut in 0.0 6.0; do
    for mult in 1 2 3 4; do
        N=$(( mult *  num_part ))

        if [[ "$mult -eq 1" ]]
        then
            lammp_dir="lammps"
        else
            lammp_dir="lammps_lower-time-step"
        fi

        dir_name="$lammp_dir/temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${N}_M${ntasks}"
        echo "extracting performance from $dir_name"
        
        output_file="$dir_name/out.lammps"
        rate=$(grep Performance $output_file | tail -n 1 | awk '{print $(NF-1)}') 
        echo "$N  $rate" >> performance_nPart_coul$coul_cut
    done
done

# dfferent num of processers used
lj_cut=1.12
for coul_cut in 0.0 6.0; do
    for ntasks in 2 4 8 16 32; do
        dir_name="lammps/temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${num_part}_M${ntasks}"
        echo "extracting performance from $dir_name"
        
        output_file="$dir_name/out.lammps"
        rate=$(grep Performance $output_file | tail -n 1 | awk '{print $(NF-1)}') 
        echo "$ntasks  $rate" >> performance_nProc_coul$coul_cut
    done
done
