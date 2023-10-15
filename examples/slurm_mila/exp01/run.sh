#!/bin/bash
# __TODO__ fix options if needed
#SBATCH --partition=long
#SBATCH --cpus-per-task=2
#SBATCH --mem=5G
#SBATCH --time=0:05:00
#SBATCH --job-name=voicemd
#SBATCH --output=logs/out_%a.log
#SBATCH --error=logs/err_%a.log
# remove one # if you prefer receiving emails
##SBATCH --mail-type=all
##SBATCH --mail-user=jerpint@gmail.com

export MLFLOW_TRACKING_URI='../mlruns'

# 2. Copy your dataset on the compute node
#export DATADIR=$SLURM_TMPDIR/dataset
#time rsync -a --info=progress2 /__TODO__/path/to/dataset.tar $SLURM_TMPDIR/
#time tar xf $SLURM_TMPDIR/dataset.tar -C $SLURM_TMPDIR/ --strip=4

# 3. Launch your job, tell it to save the model in $SLURM_TMPDIR/output
#    and look for the dataset into $SLURM_TMPDIR/output
# use orion..
main --data no_data --output $SLURM_TMPDIR/no_output --config ../config.yaml

# 4. Copy whatever you want to save on $SCRATCH
# rsync -avz $SLURM_TMPDIR/output /network/tmp1/${USER}/
