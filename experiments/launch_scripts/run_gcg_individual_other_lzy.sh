#!/bin/bash
set -e
set -x


export WANDB_MODE=disabled

# Optionally set the cache for transformers
# export TRANSFORMERS_CACHE='YOUR_PATH/huggingface'

export model=$1 # llama2 or vicuna
export setup=$2 # behaviors or strings
export data_offset=$3
export multi_constant=$4
n_steps=1000
# Create results folder if it doesn't exist
if [ ! -d "../results_n_steps_${n_steps}_multi_${multi_constant}" ]; then
    mkdir "../results_n_steps_${n_steps}_multi_${multi_constant}"
    echo "Folder '../results_n_steps_${n_steps}_multi_${multi_constant}' created."
else
    echo "Folder '../results_n_steps_${n_steps}_multi_${multi_constant}' already exists."
fi

# n_steps=1000 is too time consuming.. try 100 first. Look at figure 2 in the paper
python -u ../main.py \
    --config="../configs/individual_${model}.py" \
    --config.attack=gcg \
    --config.train_data="../../data/advbench/harmful_${setup}.csv" \
    --config.result_prefix="../results_n_steps_${n_steps}_multi_${multi_constant}/individual_${setup}_${model}_gcg_offset${data_offset}" \
    --config.n_train_data=10 \
    --config.data_offset=$data_offset \
    --config.n_steps=$n_steps \
    --config.test_steps=250 \
    --config.batch_size=256 \
    --config.multi_constant=$multi_constant