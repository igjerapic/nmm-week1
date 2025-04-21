#!/bin/bash
#SBATCH --job-name=run_temp_1.0
#SBATCH --time=00:20:00
#SBATCH --partition=regularshort
#SBATCH --reservation=nanoscale
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

module load LAMMPS/23Jun2022-foss-2021b-kokkos

temperature=1.0

srun lmp -screen out.lammps -in scripts/in.3dlj -v T ${temperature}
