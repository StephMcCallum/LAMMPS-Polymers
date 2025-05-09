#!/bin/bash
#SBATCH -p shortgpu #gpu-p100, shortgpu, shortgpu-p100, short, bsudfq, 
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:1 #HOOMD & LAMMPS peeps, Gromacs peeps remove
#SBATCH -t 2:00:00
#SBATCH -o perf1
#SBATCH -J perf1
# #SBATCH --exclusive

module load lammps_gpu
export OMP_NUM_THREADS=4

lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N20.data -v T_target 0.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N20T0.5 -v prodSteps 1000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N20.data -v T_target 1.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N20T1.0 -v prodSteps 1000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N20.data -v T_target 1.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N20T1.5 -v prodSteps 1000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N20.data -v T_target 2.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N20T2.0 -v prodSteps 1000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N50.data -v T_target 0.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N50T0.5 -v prodSteps 1000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N50.data -v T_target 1.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N50T1.0 -v prodSteps 1000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N50.data -v T_target 1.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N50T1.5 -v prodSteps 1000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N50.data -v T_target 2.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N50T2.0 -v prodSteps 1000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N100.data -v T_target 0.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N100T0.5 -v prodSteps 10000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N100.data -v T_target 1.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N100T1.0 -v prodSteps 10000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N100.data -v T_target 1.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N100T1.5 -v prodSteps 10000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N100.data -v T_target 2.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N100T2.0 -v prodSteps 10000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N200.data -v T_target 0.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N200T0.5 -v prodSteps 10000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N200.data -v T_target 1.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N200T1.0 -v prodSteps 10000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N200.data -v T_target 1.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N200T1.5 -v prodSteps 10000000
lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N200.data -v T_target 2.0 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N200T2.0 -v prodSteps 10000000
