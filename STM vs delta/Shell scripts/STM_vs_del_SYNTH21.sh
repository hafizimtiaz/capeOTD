#!/bin/bash

## The submit script for MATLAB multicore run.
## It runs matlab threads on one node only.
## 1. Specify the job name in '--job-name='.
## 2. Specify the number of requested CPUs/Cores in '--ntasks-per-node=' 
## 3. Load matlab module: "module purge; module load matlab" 
## 4. Submit the script to the cluster through SLURM: "sbatch matlab_multicore_batch.sh"  


#SBATCH --job-name=stm_21
#SBATCH --output=stm_21.out
#SBATCH --error=stm_21.err
#SBATCH --partition=SOE_main
#SBATCH --ntasks-per-node=4
#SBATCH --mail-type=ALL														
#SBATCH --mail-user=hafiz.imtiaz@rutgers.edu											

MYHDIR=$SLURM_SUBMIT_DIR													
MYTMP="/tmp/$USER/$SLURM_JOB_ID"    												
mkdir -p $MYTMP                     												
cp $MYHDIR/STM_vs_delta_SYNTH21_combined.m  $MYTMP
cp $MYHDIR/mySymmTensor.m  $MYTMP
cp $MYHDIR/myDProbustTPM.m  $MYTMP
cp $MYHDIR/myEigVecCheck.m  $MYTMP
cp $MYHDIR/myEigValCheck.m  $MYTMP
cp $MYHDIR/myVectorNoise.m  $MYTMP
cp $MYHDIR/myCAPEAGN.m  $MYTMP
cp $MYHDIR/myPreProcessProbabilityVects.m  $MYTMP
cp $MYHDIR/my_multilinear_tensor.m  $MYTMP
cp $MYHDIR/tmprod.m  $MYTMP
cp $MYHDIR/outprod.m  $MYTMP
cp $MYHDIR/tt_ind2sub.m  $MYTMP
cp $MYHDIR/tt_sub2ind.m  $MYTMP
cp $MYHDIR/STM_data_K_10_D_50_N_100k.mat  $MYTMP

cd $MYTMP                           										

matlab -nodisplay -nosplash -r "STM_vs_delta_SYNTH21_combined, exit"

cp $MYTMP/* $MYHDIR                 										
rm -rf  $MYTMP                      										