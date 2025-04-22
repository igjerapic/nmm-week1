#!/bin/bash

# Go to each simulation directory and create a slurm submission script to submit the simulation

lammps_script_location="$(pwd)/in.3dlj"

temperature=1.0
eta=0.5
num_part=4096 # number of particles
ntasks=1      # number of processors used in mpirun -np M before 
coul_cut=0.0
for lj_cut in 1.12 2.0 4.0 6.0; do

    dir_name="temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${num_part}_M${ntasks}"
    slurm_script="$dir_name/submit.sh"
    echo "Creating SLURM script in $dir_name"

    cat > "$slurm_script" <<EOL
#!/bin/bash
#SBATCH --job-name=run_temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${num_part}_M${ntasks}
#SBATCH --time=03:00:00
#SBATCH --partition=regularshort
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=${ntasks}

module load LAMMPS/23Jun2022-foss-2021b-kokkos

srun lmp -screen out.lammps -in $lammps_script_location -v num_part $num_part -v T $temperature -v ETA $eta -v lj_cutoff $lj_cut -v coul_cut $coul_cut

# Uncomment when testing locally
# mpirun -np ${ntasks} lmp -screen out.lammps -in $lammps_script_location -v num_part $num_part -v T $temperature -v ETA $eta -v lj_cutoff $lj_cut -v coul_cut $coul_cut
EOL

    chmod +x "$slurm_script"

done
