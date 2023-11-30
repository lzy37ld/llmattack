# !/bin/bash

# multi_constant=0
# multi_constant=0
# multi_constant=0
# multi_constant=0

# for i in $(seq 440 10 510)
# do
#    sbatch run.slurm $i $multi_constant
# done

# for i in $(seq 340 10 390)
# do
#    sbatch run.slurm $i $multi_constant
# done

# for i in $(seq 240 10 290)
# do
#    sbatch run.slurm $i $multi_constant
# done

# for i in $(seq 140 10 190)
# do
#    sbatch run.slurm $i $multi_constant
# done

# for i in $(seq 40 10 90)
# do
#    sbatch run.slurm $i $multi_constant
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



multi_constant=1

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
