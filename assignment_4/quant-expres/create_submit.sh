#!/bin/bash
ecut=$1
nk=$2
conv_thr=$3
ntasks=$4


dir_name="Si.scf_ecutwfc${ecut}_nk${nk}_conv-thr${conv_thr}_ntasks${ntasks}"
slurm_script="$dir_name/quantum.qsub"
echo "Creating SLURM script in $dir_name"

cat > "$slurm_script" <<EOL
#!/bin/bash
#SBATCH -J QE_Si_ecutwfc${ecut}_nk${nk}_conv-thr${conv_thr}_ntasks${ntasks}
#SBATCH -o %j.out
#SBATCH -p parallel
#SBATCH -N 1
#SBATCH -n ${ntasks}
#SBATCH -t 00:20:00

module load QuantumESPRESSO/7.1-foss-2022a
srun pw.x < Si.scf.in > Si.scf.out
EOL

chmod +x "$slurm_script"
