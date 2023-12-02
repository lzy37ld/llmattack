#!/bin/bash
#SBATCH --job-name=attack               # name
#SBATCH --nodes=1                    # nodes
#SBATCH --ntasks-per-node=1          # crucial - only 1 task per dist per node!
#SBATCH --cpus-per-task=10           # number of cores per tasks
#SBATCH --gres=gpu:1                 # number of gpus
#SBATCH --time 3:00:00               # maximum execution time (HH:MM:SS)
#SBATCH --output=%x-%j.out           # output file name
export offset=$1
export multi_constant=$2



n_steps=1000
multi_constant=1
# Create results folder if it doesn't exist
if [ ! -d "../results_n_steps_${n_steps}_multi_${multi_constant}" ]; then
    mkdir "../results_n_steps_${n_steps}_multi_${multi_constant}"
    echo "Folder '../results_n_steps_${n_steps}_multi_${multi_constant}' created."
else
    echo "Folder '../results_n_steps_${n_steps}_multi_${multi_constant}' already exists."
fi

# n_steps=1000 is too time consuming.. try 100 first. Look at figure 2 in the paper
python -u ../main.py \
    --config="../configs/individual_llama2.py" \
    --config.attack=gcg \
    --config.train_data="../../data/advbench/harmful_behaviors.csv" \
    --config.result_prefix="../results_n_steps_${n_steps}_multi_${multi_constant}/individual_behaviors_llama2_gcg_offset149" \
    --config.n_train_data=1 \
    --config.data_offset=149 \
    --config.n_steps=$n_steps \
    --config.test_steps=250 \
    --config.batch_size=256 \
    --config.multi_constant=$multi_constant