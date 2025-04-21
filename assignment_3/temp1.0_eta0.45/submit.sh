#!/bin/bash
#SBATCH --job-name=run_temp1.0_eta0.45
#SBATCH --time=00:20:00
#SBATCH --partition=regularshort
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

#module load LAMMPS/23Jun2022-foss-2021b-kokkos

#srun lmp -screen out.lammps -in /home/ilija/uni/nanoscale/nmm-week1/assignment_3/in.3dlj -v T 1.0 -v ETA 0.45
lmp -in /home/ilija/uni/nanoscale/nmm-week1/assignment_3/in.3dlj -v T 1.0 -v ETA 0.45 > out.lammps
