#!/bin/bash

conv_thr="1.0d-8"
ecut=40.0

rm si.etot_vs_nkpoints
for nk in 2 4 6 8; do 
   dir_name="Si.scf_ecutwfc${ecut}_nk${nk}_conv-thr${conv_thr}"
   output_file="$dir_name/Si.scf.out"
   etot=$(grep -e ! $output_file | awk '/!/              {print $(NF-1)}') 
   echo "$nk  $etot" >> si.etot_vs_nkpoints
done


