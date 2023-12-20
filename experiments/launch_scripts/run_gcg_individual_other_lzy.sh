#!/bin/bash
set -e
set -x


base_ckpt=$WHY_ATTACK_CKPT
base_data=$WHY_ATTACK_DATA

if [ -z "$base_ckpt" ]; then
    base_ckpt='.'
fi

if [ -z "$base_data" ]; then
    base_data='.'
fi

export WANDB_MODE=disabled

# Optionally set the cache for transformers
# export TRANSFORMERS_CACHE='YOUR_PATH/huggingface'

export model=$1 # llama2 or vicuna
export setup=$2 # behaviors or strings
export data_offset=$3
export n_steps=$4


# Create results folder if it doesn't exist

if [ ! -d "${base_data}/results_n_steps_${n_steps}_${model}" ]; then
    mkdir "${base_data}/results_n_steps_${n_steps}_${model}"
    echo "Folder '${base_data}/results_n_steps_${n_steps}_${model}' created."
else
    echo "Folder '${base_data}/results_n_steps_${n_steps}_${model}' already exists."
fi

python -u ../main.py \
    --config="../configs/individual_${model}.py" \
    --config.attack=gcg \
    --config.train_data="../../data/advbench/harmful_${setup}.csv" \
    --config.result_prefix="${base_data}/results_n_steps_${n_steps}_${model}/individual_${setup}_${model}_gcg_offset${data_offset}" \
    --config.n_train_data=10 \
    --config.data_offset=$data_offset \
    --config.n_steps=$n_steps \
    --config.test_steps=1 \
    --config.batch_size=256