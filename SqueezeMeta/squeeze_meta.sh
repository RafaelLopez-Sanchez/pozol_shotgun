#!/bin/bash
#$ -N  squeeze_meta
#$ -pe mpi 30
#$ -cwd
#$ -l h_vmem=16G  

export PATH=/home/install/miniconda3/envs/SqueezeMeta/bin:$PATH


SqueezeMeta.pl -m coassembly -c 400 -p coatza_v1.3 -s sample.file -f /dos/rafaells/cesar/fastq/ -t 30 --D --lowmem

conda deactivate
####### Script hecho por Rafael López Sánchez,creado el 7 de marzo del 2019,Instituto de Biotecnología UNAM.
