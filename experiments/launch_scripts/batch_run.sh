# !/bin/bash

# multi_constant=0
# multi_constant=0
# multi_constant=0
# multi_constant=0

# for i in $(seq 440 10 510)
# do
#    sbatch run.slurm $i
# done

# for i in $(seq 340 10 390)
# do
#    sbatch run.slurm $i
# done

# for i in $(seq 240 10 290)
# do
#    sbatch run.slurm $i
# done

# for i in $(seq 140 10 190)
# do
#    sbatch run.slurm $i
# done

# for i in $(seq 40 10 90)
# do
#    sbatch run.slurm $i
# done



# # # Nov 25 5:10 AM
# # sbatch run.slurm 420
# # sbatch run.slurm 320
# # sbatch run.slurm 220
# # sbatch run.slurm 120
# # sbatch run.slurm 20


# # # Nov 28 5:10 AM
# sbatch run.slurm 130
# sbatch run.slurm 230
# sbatch run.slurm 330
# sbatch run.slurm 430



# n_steps=500
# for i in $(seq 400 20 500)
# do
#    sbatch run.slurm $i $n_steps
# done

# for i in $(seq 300 20 380)
# do
#    sbatch run.slurm $i $n_steps
# done

# for i in $(seq 200 20 280)
# do
#    sbatch run.slurm $i $n_steps
# done

# for i in $(seq 100 20 180)
# do
#    sbatch run.slurm $i $n_steps
# done

# for i in $(seq 0 20 80)
# do
#    sbatch run.slurm $i $n_steps
# done






n_steps=500
for i in $(seq 400 20 500)
do
   sbatch run_vicuna.slurm $i $n_steps
done

for i in $(seq 300 20 380)
do
   sbatch run_vicuna.slurm $i $n_steps
done

for i in $(seq 200 20 280)
do
   sbatch run_vicuna.slurm $i $n_steps
done

for i in $(seq 100 20 180)
do
   sbatch run_vicuna.slurm $i $n_steps
done

for i in $(seq 0 20 80)
do
   sbatch run_vicuna.slurm $i $n_steps
done