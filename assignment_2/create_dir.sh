#!/bin/bash

ecut=$1
nk=$2
conv_thr=$3

dir_name="Si.scf_ecutwfc${ecut}_nk${nk}_conv-thr${conv_thr}"
echo "Creating directory: $dir_name"
mkdir -p "$dir_name"
