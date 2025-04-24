#!/bin/bash

# Go to each simulation directory and create a slurm submission script to submit the simulation

lammps_script_location="$(pwd)/in.3dlj"

temperature=1.0
eta=0.5
num_part=4096 # number of particles
ntasks=1    # number of processors used in mpirun -np M before 
lj_cut=1.12
time=""
for coul_cut in 0.0 6.0; do
    for mult in 2 3 4; do
        N=$(( mult *  num_part ))
        dir_name="temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${N}_M${ntasks}"
        slurm_script="$dir_name/submit.sh"
        echo "Creating SLURM script in $dir_name"

        # longer runtime for coulombic interactions
        if [[ "echo ${coul_cut} == 6.0 | bc -l" ]]
        then
            time="08:00:00"
        else 
            time="04:00:00"
        fi
        cat > "$slurm_script" <<EOL
#!/bin/bash
#SBATCH --job-name=run_temp${temperature}_eta${eta}_LJ${lj_cut}_COUL${coul_cut}_N${N}_M${ntasks}_shortrun
#SBATCH --time=${time}
#SBATCH --partition=regularshort
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=${ntasks}

module load LAMMPS/23Jun2022-foss-2021b-kokkos

srun lmp -screen out.lammps -in $lammps_script_location -v num_part $N -v T $temperature -v ETA $eta -v lj_cutoff $lj_cut -v coul_cut $coul_cut

# Uncomment when testing locally
# mpirun -np ${ntasks} lmp -screen out.lammps -in $lammps_script_location -v num_part $N -v T $temperature -v ETA $eta -v lj_cutoff $lj_cut -v coul_cut $coul_cut
EOL

        chmod +x "$slurm_script"

    done
done
