#!/bin/bash
#SBATCH --time=00:20:00
#SBATCH --partition=regularshort
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

module load LAMMPS/23Jun2022-foss-2021b-kokkos

jobname="run_temp$1_eta$2"
temperature=$1
eta=$2

srun -J ${jobname} lmp -screen out.lammps -in scripts/in.3dlj -v T ${temperature} eta ${eta}
