# !/bin/bash


multi_constant=0

for i in $(seq 440 10 510)
do
   sbatch run.slurm $i $multi_constant
done

for i in $(seq 340 10 390)
do
   sbatch run.slurm $i $multi_constant
done

for i in $(seq 240 10 290)
do
   sbatch run.slurm $i $multi_constant
done

for i in $(seq 140 10 190)
do
   sbatch run.slurm $i $multi_constant
done

for i in $(seq 40 10 90)
do
   sbatch run.slurm $i $multi_constant
done

