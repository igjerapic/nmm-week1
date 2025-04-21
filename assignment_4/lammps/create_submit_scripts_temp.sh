#!/bin/bash

# Go to each simulation directory and create a slurm submission script to submit the simulation

lammps_script_location="$(pwd)/in.3dlj"

for temperature in 1.0 0.9 0.8 0.7; do

    dir_name="temp${temperature}_eta${eta}"
    slurm_script="$dir_name/submit.sh"
    echo "Creating SLURM script in $dir_name"

    cat > "$slurm_script" <<EOL
#!/bin/bash
#SBATCH --job-name=run_temp${temperature}_eta${eta}
#SBATCH --time=00:20:00
#SBATCH --partition=regularshort
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

module load LAMMPS/23Jun2022-foss-2021b-kokkos

srun lmp -screen out.lammps -in $lammps_script_location -v T $temperature -v ETA $eta

# Uncomment to test locally
# lmp -in $lammps_script_location -v T $temperature -v ETA $eta > out.lammps
EOL

    chmod +x "$slurm_script"

done
