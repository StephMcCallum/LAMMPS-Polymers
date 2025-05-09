#!/bin/bash
#SBATCH -p shortgpu #gpu-p100, shortgpu, shortgpu-p100, short, bsudfq, 
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:1 #HOOMD & LAMMPS peeps, Gromacs peeps remove
#SBATCH -t 1:00:00
#SBATCH -o perf1
#SBATCH -J perf1
# #SBATCH --exclusive

module load lammps_gpu
export OMP_NUM_THREADS=4
#mpirun -np 1 -npernode 4 gmx_mpi ...
#mpirun -np 1 -npernode 4 lmp -sf gpu -pk gpu 1 -in in.nvt -v T_target 2.0 -v tag numDen 0.02

lmp -in ../lammps-input/in.nvt-restart -v T_target 0.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N20T0.5 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 1.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N20T1.0 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 1.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N20T1.5 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 2.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N20T2.0 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 0.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N50T0.5 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 1.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N50T1.0 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 1.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N50T1.5 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 2.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N50T2.0 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 0.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N100T0.5 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 1.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N100T1.0 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 1.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N100T1.5 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 2.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N100T2.0 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 0.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N200T0.5 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 1.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N200T1.0 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 1.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N200T1.5 -v prodSteps 100000
lmp -in ../lammps-input/in.nvt-restart -v T_target 2.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N200T2.0 -v prodSteps 100000
#lmp -in ../lammps-input/in.nvt-restart -v confFileName polymer_rho0.02x2.data -v T_target 1.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag prod-rho0.02 -v prodSteps 10000

#lmp -in ../lammps-input/in.nvt-restart -v confFileName polymer_rho0.02x2.data -v T_target 0.2 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag prod-rho0.02 -v prodSteps 10000

