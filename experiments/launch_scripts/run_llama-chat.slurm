#!/bin/bash
#SBATCH --job-name=attack               # name
#SBATCH --nodes=1                    # nodes
#SBATCH --ntasks-per-node=1          # crucial - only 1 task per dist per node!
#SBATCH --cpus-per-task=10           # number of cores per tasks
#SBATCH --gres=gpu:1                 # number of gpus
#SBATCH --time 50:00:00               # maximum execution time (HH:MM:SS)
#SBATCH --output=%x-%j.out           # output file name
export offset=$1
export n_steps=$2


# wrong
# srun --jobid $SLURM_JOBID bash -c 'bash run_gcg_individual_other_lzy.sh llama2-chat behaviors $offset ; bash run_gcg_individual_other_lzy.sh llama2-chat behaviors $((offset+10))'

# correct
# n_train_data=10
srun --jobid $SLURM_JOBID bash -c 'bash run_gcg_individual_other_lzy.sh llama2-chat behaviors $offset $n_steps & bash run_gcg_individual_other_lzy.sh llama2-chat behaviors $((offset+10)) $n_steps & wait'


# 一个 set n_train_data = 1
# srun --jobid $SLURM_JOBID bash -c 'bash run_gcg_individual_other_lzy.sh llama2-chat behaviors $((offset+9))'