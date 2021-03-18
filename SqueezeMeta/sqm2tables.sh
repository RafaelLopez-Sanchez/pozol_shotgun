#!/bin/bash
#$ -N sqm2tables
#$ -cwd
#$ -pe mpi 10
#$ -l h_vmem=8G

export PATH=/home/install/miniconda3/envs/SqueezeMeta/bin:$PATH

sqm2tables.py --trusted-functions --ignore-unclassified --force-overwrite /dos/rafaells/Pozol_2021/pozol /dos/rafaells/Pozol_2021/pozol/results/tables 

conda deactivate