# LAMMPS-Polymers
Project 3 MSE563

## Dependencies:
-LAMMPS GPU Version
-Python 3 (numpy, matplotlib)
-VMD for visualization

## Directory
- 'lammps-input' - This directory includes LAMMPS input files to run NVT simulations and initial configuraiton data files.
- 'scripts' - This includes notebooks of Python scripts for initial configurations, analysis, and plotting.
- 'slurm-batch-scripts' - Slurm script for Borah.
- 'results' - Output files from my simulations.

## Directions to run:

Start an interactive session on Borah On-Demand Jupyter Notebook 3.9.2 with GPU nodes, partition ondemand-p100, 4 cores.
At this step, in the 'Additonal commands to run' box, you can do:

module load lammps_gpu

If you forget this step, you can later run it in the command line.

The initialization files were generated with /scripts/init_conf.py. These generated data files are included in /lammps-input/data/ if you want to skip this step.

The LAMMPS input files under 'lammps-input/' define the simulation parameters. I used in.nvt-general-rdf (harmonic) and in.nvt-general-rdf-fene
which define NVT simulations from a file for inital configurations. These input files take command line prompts for confFileName, T_target, mySeed, nRdfBins, rdfCutoff tag, and prodSteps. Here is an example of how you could run one simulation from the command line:
  lmp -in ../lammps-input/in.nvt-general-rdf -v confFileName ../lammps-input/data/polymer_N20.data -v T_target 0.5 -v mySeed 2024 -v nRdfBins 100 -v rdfCutoff 5.0 -v tag N20T0.5 -v prodSteps 1000000

For running parameter sweeps, the above command in included in a sbatch file under slurm-batch-scripts/submit-job-fene.sh and submit-job-harm.sh. On a GPU node of the terminal (after running 'module load lammps_gpu') you can submit this to run 16 jobs each, 4N X 4T, through the command:
  sbatch submit-job-fene.sh

Once done running, you can check for equillibration using the equillibration notebook under scripts/. If the the systems has not equillibrated, you must run longer. You will need to update with the direct filepath to your data. You can also run the analysis notebooks.

