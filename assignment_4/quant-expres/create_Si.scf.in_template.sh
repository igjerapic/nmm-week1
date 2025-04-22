#!/bin/bash

# Go to each simulation directory and create a Si.scf.in file based on the ecutwfc, nk-points, and conv_thr 

# ecut=40.0
# nk=4
# conv_thr="1.0d-8"

ecut=$1
nk=$2
conv_thr=$3
ntasks=$4

potential_file="$(pwd)/Si.pbe-nl-rrkjus_psl.1.0.0.UPF"

dir_name="Si.scf_ecutwfc${ecut}_nk${nk}_conv-thr${conv_thr}_ntasks${ntasks}"
input_script="$dir_name/Si.scf.in"
echo "Creating PW input script and copying PW potenial file in $dir_name"

cp $potential_file $dir_name/Si.pbe-nl-rrkjus_psl.1.0.0.UPF

cat > "$input_script" <<EOL
 &control
    calculation = 'scf'
    restart_mode='from_scratch',
    prefix='Si',
    pseudo_dir = './'
    outdir = './'
 /
 &system    
    ibrav=  2, celldm(1) =10.261213, nat=  2, ntyp= 1,
    ecutwfc =${ecut}
 /
 &electrons
    mixing_mode = 'plain'
    mixing_beta = 0.7 
    conv_thr =  ${conv_thr}
 /

ATOMIC_SPECIES
 Si  28.086  Si.pbe-nl-rrkjus_psl.1.0.0.UPF
ATOMIC_POSITIONS (alat)
 Si 0.00 0.00 0.00 
 Si 0.25 0.25 0.25 
K_POINTS {automatic}
  ${nk} ${nk} ${nk} 1 1 1
EOL
