#!/bin/bash
#$ -N  squeeze_meta
#$ -pe mpi 30
#$ -cwd
#$ -l h_vmem=16G  

export PATH=/home/install/miniconda3/envs/SqueezeMeta/bin:$PATH


SqueezeMeta.pl -m coassembly -p pozol -s sample.file -f fastq/ -t 16 --D --lowmem

conda deactivate
####### Script hecho por Rafael López Sánchez,creado el 7 de marzo del 2019,Instituto de Biotecnología UNAM.
