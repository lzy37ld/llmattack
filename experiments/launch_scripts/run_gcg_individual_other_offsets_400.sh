#!/bin/bash

set -e
set -x
export WANDB_MODE=disabled

# Optionally set the cache for transformers
# export TRANSFORMERS_CACHE='YOUR_PATH/huggingface'

export model=$1 # llama2 or vicuna
export setup=$2 # behaviors or strings

# Create results folder if it doesn't exist
if [ ! -d "../results" ]; then
    mkdir "../results"
    echo "Folder '../results' created."
else
    echo "Folder '../results' already exists."
fi

for data_offset in 410 420 430 440 450 460 470 480 490 500 510
do


# n_steps=1000 is too time consuming.. try 100 first. Look at figure 2 in the paper
    python -u ../main.py \
        --config="../configs/individual_${model}.py" \
        --config.attack=gcg \
        --config.train_data="../../data/advbench/harmful_${setup}.csv" \
        --config.result_prefix="../results_n_step_1000/individual_${setup}_${model}_gcg_offset${data_offset}" \
        --config.n_train_data=10 \
        --config.data_offset=$data_offset \
        --config.n_steps=1000 \
        --config.test_steps=250 \
        --config.batch_size=256

done