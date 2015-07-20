#!/bin/bash -l
#!/bin/bash
#SBATCH -D /group/jrigrp4/cnvwin/data
#SBATCH -o /group/jrigrp4/cnvwin/logs/angsd2fastphase_out_log-%j.txt
#SBATCH -e /group/jrigrp4/cnvwin/logs/angsd2fastphase_err_log-%j.txt
#SBATCH -J angsd2phase
#SBATCH --mem-per-cpu=10000
#SBATCH --cpus-per-task=1
#SBATCH --array=1

##Simon Renny-Byfield, UC Davis, July 2015

echo "Starting Job:"
date

perl ../scripts/angsd2fastphase.pl <( zcat ../../custom_cnv/sfs/windows/genotypes_teosinte19.geno.gz | awk '$1==$SLURM_ARRAY_TASK_ID {print}' ) ../../teosinte_parents/genomes/TRIP.fa > "$SLURM_ARRAY_TASK_ID"_genotypes.fastPh

echo "Ending Job:"
date

