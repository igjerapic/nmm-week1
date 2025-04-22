#!/bin/bash

nk=4
conv_thr="1.0d-8"

rm si.etot_vs_ecut
for ecut in 20.0 30.0 40.0 50.0; do 
   dir_name="Si.scf_ecutwfc${ecut}_nk${nk}_conv-thr${conv_thr}"
   output_file="$dir_name/Si.scf.out"
   etot=$(grep -e ! $output_file | awk '/!/              {print $(NF-1)}') 
   echo "$ecut  $etot" >> si.etot_vs_ecut
done


